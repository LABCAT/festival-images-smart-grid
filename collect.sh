#!/bin/bash

# show commands and stop if there is an error
set -ex

# make the directory if it is not there
mkdir -p downloads

# clean the directory if there are old results
rm -f downloads/*

SEARCH_STRING="robot"

# get 50 pages
for PAGE in {1..50}
do
    # build the url
    URL='http://www.sluniverse.com/snapzilla/Home/Search?term='$SEARCH_STRING'&page='$PAGE'#pictures'
    
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

#change to the downloads directory
cd downloads

#remove query strings from all jpg files
for file in *.jpg\?*; do mv "$file" "${file%%\?*}"; done

#remove query strings from all png files
for file in *.png\?*; do mv "$file" "${file%%\?*}"; done

#return to previous directory
cd ../

# URL='http://www.trademe.co.nz/Browse/SearchResults.aspx?&cid=0&searchType=&searchString='$SEARCH_STRING'&x=0&y=0&type=Search&sort_order=&redirectFromAll=False&rptpath=all&page='$PAGE'&user_region=100&user_district=0&generalSearch_keypresses=8&generalSearch_suggested=0&generalSearch_suggestedCategory='