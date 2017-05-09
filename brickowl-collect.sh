#!/bin/bash

# show commands and stop if there is an error
set -ex

# make the directory if it is not there
mkdir -p downloads

# clean the directory if there are old results
rm -f downloads/*

#SEARCH_STRING="robot"

#create a array of keywords to use in the scrape

# get 50 pages
for PAGE in {1..50}
do
	# build the url
	URL='http://www.brickowl.com/catalog/lego-minifigures?page='$PAGE
	
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