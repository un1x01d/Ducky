# MacOS Red Looter
This payload will loot the Desktop and Documents directories and some other important files.  
The looted files will be compressed and uploaded over SCP to the set destination SSH server.
###### This payload is for red-team operations that require data as evidence or _**authorized**_ pentesting.

#### This is a two stage payload that will download and execute the loot script in the background.

## Usage:


### Configure `loot.sh`
  - Generate **temporary** SSH key or use existing.
  - Upload the private key to any web server (for external work, use dropbox).
  - Set the values of the variables
```
   SSH_HOST=""
   SSH_USER=""
   SSH_KEY_URL=""
```

### Upload `loot.sh` 
Upload the `loot.sh` file to a webserver and replace the value _<SCRIPT URL>_ with the URL of the webserver in `payload.txt`.  
  _If you use the URl to the raw file on github the first stage will take longer since it's a long URL which makes it more noticable._

##### Originally tested with OM.G Cable but should work for all the duckyscript based devices
