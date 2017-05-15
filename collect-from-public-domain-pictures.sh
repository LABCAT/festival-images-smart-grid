#!/bin/bash

# show commands and stop if there is an error
set -ex

# make the directory if it is not there
mkdir -p downloads

# clean the directory if there are old results
rm -f downloads/*

PAGE=0

# get 57 pages
for i in {0..57}
do
	PAGE=$((i * 50))
	# build the url
	URL='http://www.publicdomainpictures.net/browse-category.php?page='$PAGE'&c=lightnbspeffects&s=9'
	
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