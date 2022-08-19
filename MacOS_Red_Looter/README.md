# MacOS Red Looter

This is a two stage payload that will download and execute the loot script in the background.
##### This payload is useful in red-team engagements or **authorized** pentesting._

### Stage 1
Upload the `loot.sh` file to a webserver and replace the value _<SCRIPT URL>_ with the URL of the webserver.
  _If you use the URl to the raw file on github the first stage will take longer since it's long path which makes it more noticable._

### Stage 2
This script will loot the Desktop and Documents directories and some other important files.
  The looted files will be compressed and uploaded over SCP to the set destination SSH server.

## Usage
  - Upload the pivate key to any web server (for external just use dropbox).
  - Set the URL to the key uploaded.
  - Set the SSH server address
  - Run! - The file will be saved as .loot.tgz on the remote host.
