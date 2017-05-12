#!/bin/bash

# show commands and stop if there is an error
set -ex

# make the directory if it is not there
mkdir -p downloads

# clean the directory if there are old results
rm -f downloads/*

#SEARCH_STRING="robot"

#Create a array of keywords to use in the scrape.
#This allows me to scrape images for a set of keywords instead of just one.
#I needed to implement this as the search functionality of the site I am scraping
#was not complex enough to allow for "OR" based searches.
declare -a arr=("guitar" "piano" "keyboard" "turntable" "violin" "cello" "saxophone" "trumpet" "bass" "horn" "drum" "tuba" "harp")


for i in "${arr[@]}"
do
   # get 20 pages
    for PAGE in {1..20}
    do
        # build the url
        URL='http://www.sluniverse.com/snapzilla/Home/Search?term='$i'&page='$PAGE'#pictures'

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
done


# URL='http://www.trademe.co.nz/Browse/SearchResults.aspx?&cid=0&searchType=&searchString='$SEARCH_STRING'&x=0&y=0&type=Search&sort_order=&redirectFromAll=False&rptpath=all&page='$PAGE'&user_region=100&user_district=0&generalSearch_keypresses=8&generalSearch_suggested=0&generalSearch_suggestedCategory='