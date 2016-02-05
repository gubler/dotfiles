# Post-Install Config

## gmvault

You need to do the initial sync with gmvault manually so that the authorization tokens can be saved and the recurring task can then do a quick sync.

These steps load a launchd agent to run gmvault every 15 minutes. **NOTE:** The paths on Lines 16, 24, and 26 must be full paths. You _cannot_ leave the ~ for your home directory.

1. Copy the `local.gmvault.plist` to `~/Library/LaunchAgents/`
2. Modify:
    * Line 11: The gmvault binary (`which gmvault`)
    * Line 16: Directory to backup to
    * Line 17: Email Address to backup
    * Line 24/26: Change the path for log file
3. Load the plist file: `launchctl load ~/Library/LaunchAgents/local.gmvault.plist`

## Keyboard Config (Karabiner and Seil)

I follow the instructions by Brett Terpstra ([here](http://brettterpstra.com/2015/12/18/a-hyper-key-that-can-still-yell/) and [here](http://brettterpstra.com/2012/12/08/a-useful-caps-lock-key/)) to remap my Caps Lock key to act as Escape when pressed or Hyper (Command-Shift-Option-Control) when held (make sure you change CapsLock to _No Action_ in Preferences -> Keyboard -> Modifier Keys on Mac OS X).

The `private.xml` file that I use is in the `reference` folder, which also has a section for switching the modifier keys on my MS Sculpt Ergonomic keyboard.
