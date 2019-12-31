#!/usr/bin/env bash

# Sync /public (containing finalised HTML and resources)
# to webserver (e.g. ianhocking.com)

# e - exit if command exits with error
# u - treat unset variables as an error
set -eu

dir="/Users/ianuser/Sync/org/blog/programmer/"
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
if rsync -r --compress --progress --recursive public/. ianhocki@ianhocking.com:public_html/prog/ ; then
	echo "rsync: success" >> "$logFile"
else
	echo "rsync: failed" >> "$logFile"
fi
