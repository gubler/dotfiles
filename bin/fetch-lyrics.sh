#!/usr/bin/env bash

# This script will scan a folder, search for music (files with *.wav, *.m4a, *.flac, or *.mp3 extensions)
# It will attempt to gather the track, album, and artist name as well as the duration.
# After gathering this information, it will use ffprobe to query LRCAPI. The response
# will be parsed and the script will determine if synced *.lrc lyrics are available and fall back to *.txt
# plain lyrics if available. The appropriate lyrics will be written to disc with the same filename convention
# as the music file.

# The script will output a fair bit of information while processing

# Dependencies:
# ffmpeg (for ffprobe) and jq for JSON parsing
#

# Usage:
#
# The script has (4) switches --debug, --no-recurse, and --hide_lyrics
# --debug: Default is off. Passing the switch turns it on. In debug mode, no lyrics are written to disc
# --no-recurse: Default is on. Passing this switch turns of recursion.
# --hide_lyrics: Default is on. Passing this will turn off the console log display of fetched lyrics.

# Sample usage
#
# Search/update a folder recursively:
# ./fetch-lyrics.sh /media/music
#
# Search a folder without recursion
# ./fetch-lyrics.sh /media/music/SomeArtist/SomeAlbum
#
# Search a folder recursively without writing lyrics:
# ./fetch-lyrics.sh /media/music --debug
#

# Default values
DEBUG_MODE=false
RECURSION=true
SHOW_LYRICS=true

# Initialize counters
processed_files=0
skipped_files=0
notfound_files=0

# Start timer
start_time=$(date +%s)

# Check if the correct number of arguments is provided
if [ "$#" -lt 1 ] || [ "$#" -gt 3 ]; then
    echo "Usage: $0 <source_directory> [--debug] [--hide-lyrics]"
    exit 1
fi

# Parse command-line arguments
while [[ "$#" -gt 0 ]]; do
    case $1 in
    --no-recurse) RECURSION=false ;;
    --debug) DEBUG_MODE=true ;;
    --hide-lyrics) SHOW_LYRICS=false ;;
    *) SOURCE_DIR="$1" ;;
    esac
    shift
done

# Check if the source directory is provided
if [ -z "$SOURCE_DIR" ]; then
    echo "Usage: $0 [--no-recurse] [--debug] <source_directory>"
    exit 1
fi

# Check if the directory exists
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Error: Directory $SOURCE_DIR does not exist."
    exit 1
fi

# Function to URL encode a string
urlencode() {
    local raw="$1"
    local encoded
    encoded=$(printf '%s' "$raw" | jq -sRr @uri)
    echo "$encoded"
}

# Function to handle cleanup on interrupt (Ctrl-C)
cleanup() {
    echo
    echo "Script interrupted. Cleaning up..."
    end_time=$(date +%s)
    duration=$((end_time - start_time))
    echo "Processing duration: $duration seconds."
    echo "Total files to process: $total_files"
    echo "Files processed: $processed_files"
    echo "Files skipped: $skipped_files"
    exit 1
}

# Function to get track metadata
get_metadata() {
    file="$1"

    local __track_name
    local __artist_name
    local __album_name
    local __duration

    # Extract metadata from the file itself using ffprobe (or mediainfo, exiftool, etc.)
    __track_name=$(ffprobe -v error -show_entries format_tags=title -of default=noprint_wrappers=1:nokey=1 "$file" | tr -d '\r')
    __artist_name=$(ffprobe -v error -show_entries format_tags=artist -of default=noprint_wrappers=1:nokey=1 "$file" | tr -d '\r')
    __album_name=$(ffprobe -v error -show_entries format_tags=album -of default=noprint_wrappers=1:nokey=1 "$file" | tr -d '\r')
    __duration=$(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "$file" | awk '{print int($1+0.5)}')

    # Fallback to directory structure if any metadata is missing
    if [ -z "$__track_name" ]; then
        # Remove file extension and handle special characters
        __track_name=$(basename "$file" | sed 's/\.[^.]*$//' | sed 's/[[:space:]]\+/ /g')
    fi
    if [ -z "$__artist_name" ]; then
        __artist_name=$(basename "$(dirname "$(dirname "$file")")" | sed 's/[[:space:]]\+/ /g')
    fi
    if [ -z "$__album_name" ]; then
        __album_name=$(basename "$(dirname "$file")" | sed 's/[[:space:]]\+/ /g')
    fi

    #echo "Track: $__track_name | Artist: $__artist_name | Album: $__album_name | Duration: $__duration"

    # Output the values in a format suitable for parsing
    echo "$__track_name|$__artist_name|$__album_name|$__duration"
}

# Function to process a single file
process_file() {
    file="$1"
    track_name=""
    artist_name=""
    album_name=""
    duration=""

    echo "Processing file: $file"

    # Call the function and capture its output
    metadata=$(get_metadata "$file")

    # Split the output into variables
    IFS='|' read -r track_name artist_name album_name duration <<<"$metadata"

    # URL encode parameters
    track_name_encoded=$(urlencode "$track_name")
    artist_name_encoded=$(urlencode "$artist_name")
    album_name_encoded=$(urlencode "$album_name")

    # Construct the URL
    api_url="https://lrclib.net/api/get?track_name=${track_name_encoded}&artist_name=${artist_name_encoded}&album_name=${album_name_encoded}&duration=${duration}"

    # Fetch lyrics using the URL
    response=$(curl -s "$api_url")

    # Check if the API request was successful and if lyrics were found
    if echo "$response" | grep -q "\"code\": 404"; then
        echo "Lyrics for '$track_name' by '$artist_name' not found."
        notfound_files=$((notfound_files + 1))
    else
        # Extract lyrics and print or save
        synced_lyrics=$(echo "$response" | jq -r '.syncedLyrics')
        lrc_file="${file%.*}.lrc"
        txt_file="${file%.*}.txt"

        if [ -z "$synced_lyrics" ] || [ "$synced_lyrics" = "null" ]; then
            echo "No synced lyrics found for '$track_name' by '$artist_name'."
            # You can choose to increment the counter for not found files here if needed
            notfound_files=$((notfound_files + 1))

            if [ ! -f "$txt_file" ]; then
                plain_lyrics=$(echo "$response" | jq -r '.plainLyrics')
                if [ -n "$plain_lyrics" ] && [ "$plain_lyrics" != "null" ]; then
                    echo "$plain_lyrics" >"$txt_file"
                    echo "Plain lyrics for '$track_name' fetched successfully."
                fi
            fi
        else
            if [ "$DEBUG_MODE" = true ]; then
                if [ "$SHOW_LYRICS" = true ]; then
                    echo "Synced lyrics for '$track_name' by '$artist_name':"
                    echo "$synced_lyrics"
                fi
            else
                echo "$synced_lyrics" >"$lrc_file"
                echo "Synced lyrics for '$track_name' fetched successfully."
            fi
        fi
    fi
}

# Trap Ctrl-C (SIGINT) to call cleanup function
trap cleanup SIGINT

# Generate a list of existing .lrc files
if [ "$RECURSION" = true ]; then
    existing_files=$(find "$SOURCE_DIR" -type f -name "*.lrc" -printf '%f\n' | sed 's/\.[^.]*$//')
else
    existing_files=$(find "$SOURCE_DIR" -maxdepth 1 -type f -name "*.lrc" -printf '%f\n' | sed 's/\.[^.]*$//')
fi

# Populate the files array
if [ "$RECURSION" = true ]; then
    # Recursively process files
    readarray -d '' files < <(find "$SOURCE_DIR" -type f \( -name "*.mp3" -o -name "*.m4a" -o -name "*.flac" -o -name "*.wav" \) -print0)
else
    # Non-recursive processing
    readarray -d '' files < <(find "$SOURCE_DIR" -maxdepth 1 -type f \( -name "*.mp3" -o -name "*.m4a" -o -name "*.flac" -o -name "*.wav" \) -print0)
fi

# Get the total file count
total_files=${#files[@]}

# Print the total file count
echo "Total files to process: $total_files"

# Process each file
for file in "${files[@]}"; do
    base_name=$(basename "$file" | sed 's/\.[^.]*$//')
    if ! echo "$existing_files" | grep -q "^$base_name$"; then
        process_file "$file"
        processed_files=$((processed_files + 1))
    else
        echo "Skipping $file: .lrc file already exists."
        skipped_files=$((skipped_files + 1))
    fi
done

# We could also process like this - where we just interate over every file and check for the existence
# of an *.lrc file; this could be pretty slow, though
# Populate the files array
# if [ "$RECURSION" = true ]; then
#     readarray -d '' files < <(find "$SOURCE_DIR" -type f \( -name "*.mp3" -o -name "*.m4a" -o -name "*.flac" -o -name "*.wav" \) -print0)
# else
#     readarray -d '' files < <(find "$SOURCE_DIR" -maxdepth 1 -type f \( -name "*.mp3" -o -name "*.m4a" -o -name "*.flac" -o -name "*.wav" \) -print0)
# fi

# # Process each file
# for file in "${files[@]}"; do
#     base_name=$(basename "$file" | sed 's/\.[^.]*$//')

#     # Generate expected .lrc file name
#     lrc_file="${file%.*}.lrc"

#     # Check if the .lrc file already exists
#     if [ ! -f "$lrc_file" ]; then
#         process_file "$file"
#         processed_files=$((processed_files + 1))
#     else
#         echo "Skipping $file: .lrc file already exists."
#         skipped_files=$((skipped_files + 1))
#     fi
# done

# End timer and calculate duration
end_time=$(date +%s)
duration=$((end_time - start_time))

echo "Processing complete."
echo "Processing duration: $duration seconds."
echo "Total files to process: $total_files"
echo "Files processed: $processed_files"
echo "Files skipped: $skipped_files"
echo "Files not found: $notfound_files"
