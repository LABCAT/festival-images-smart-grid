#!/bin/bash

# show commands and stop if there is an error
set -ex

# make the directory if it is not there
mkdir -p downloads

# clean the directory if there are old results
rm -f downloads/*

TAG=$1

# get 80 pages
for PAGE in {1..80}
do
	# build the url
	URL='https://www.flickr.com/photos/tags/'$1'/page'$PAGE
	
	# fetch the images
	wget --adjust-extension \
		 --random-wait \
		 --limit-rate=100k \
		 --span-hosts \
		 --convert-links \
		 --backup-converted \
		 --no-directories \
		 --timestamping \
		 --page-requisites \
		 --directory-prefix=downloads \
		 --execute robots=off \
		 --accept=*jpg*,*png* \
		 $URL

	# other unused arguments
		 # --recursive \
		 # --level 1 \
		 # --domains en.wikipedia.org \
	 
done