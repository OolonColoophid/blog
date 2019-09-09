#!/usr/bin/env bash

# Sync /public to webserver

# Receives username

# e - exit if command exits with error
# u - treat unset variables as an error
set -eu

username=ianhocki
server=ianhocking.com

# Remove previous build of site
rm -r public || echo "No /public directory to delete"

# Build
hugo

# Upload
rsync -r --verbose --compress --human-readable --progress --recursive public/. ianhocki@ianhocking.com:public_html/blog/
