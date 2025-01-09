#!/bin/bash

# Wait until Docker is available
until /usr/local/bin/docker info >/dev/null 2>&1; do
    sleep 1
done

# Navigate to the directory containing the docker-compose.yml file
cd "$HOME/Projects/archivebox" || exit

# Start the services defined in the docker-compose.yml file
/usr/local/bin/docker-compose up -d
