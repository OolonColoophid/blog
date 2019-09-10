#!/usr/bin/env bash

# Sync /public to webserver

# e - exit if command exits with error
# u - treat unset variables as an error
set -eu

username=ianhocki
server=ianhocking.com

blogDir="/Users/ianuser/Dropbox/org/blog/programmer"

# Check where this script is running from
if [ -z "$GIT_DIR" ] ; then

    echo "Run deploy.sh (for ianhocking.com/blog) from ~/Dropbox/org/" >&2
    exit 1

fi

# Remove previous build of site
rm -r public || echo "No /public directory to delete"

# Build
hugo

# Upload
rsync -r --verbose --compress --human-readable --progress --recursive public/. ianhocki@ianhocking.com:public_html/blog/
