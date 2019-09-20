#!/usr/bin/env bash

# Sync /public (containing finalised HTML and resources)
# to webserver (e.g. ianhocking.com)

# e - exit if command exits with error
# u - treat unset variables as an error
set -eu

username="ianhocki"
server="ianhocking.com"

blogDir="/Users/ianuser/Dropbox/org/blog/programmer"

# Remove previous build of site
rm -r "$blogDir/public" || echo "No /public directory in blog directory $blogDir to delete"

# Build
cd $blogDir && hugo || echo "Cannot cd to blog directory $blogDir"

# Upload
rsync -r --verbose --compress --human-readable --progress --recursive public/. ianhocki@ianhocking.com:public_html/prog/
