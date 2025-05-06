#!/usr/bin/env bash

# Sync /public (containing finalised HTML and resources)
# to webserver (e.g. ianhocking.com)

# e - exit if command exits with error
# u - treat unset variables as an error
set -eu

dir="$(pwd)/"
logFile="logs/hooks.log"

echo "---deploy.sh now takes over---" >> "$dir$logFile"

# Go
if cd "$dir" ; then
	echo "cd: success" >> "$logFile"
else
	echo "cd: failed" >> "$dir$logFile"
	exit
fi

# Remove previous build of site
if rm -r "public" ; then
	echo "rm: /public directory deleted successfully" >> "$logFile"
else
	echo "rm: failed" >> "$logFile"
	exit
fi

# Build
if hugo ; then
	echo "Hugo: success" >> "$logFile"
else
	echo "Hugo: failed" >> "$logFile"
fi

# Upload
## Note: Oct 2021
## This currently uses a key
if rsync -r --compress --progress --recursive public/. ianhocking.com@ssh.gb.stackcp.com:public_html/prog/ ; then
	echo "rsync: success" >> "$logFile"
	osascript -e 'display notification "Upload successful" with title "Blog Update"'
else
	echo "rsync: failed" >> "$logFile"
fi

