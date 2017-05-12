#!/bin/bash

# show commands and stop if there is an error
set -ex

# make the directory if it is not there
mkdir -p resized

# clean the directory if there are old results
rm -f resized/*

# this command resizes to 128x128, chopping what doesn't fit
mogrify \
  -path resized \
  -thumbnail 120x120^ \
  -background black \
  -gravity center \
  -extent 120x120 \
  'downloads/*.jpg'

mogrify \
  -path resized \
  -thumbnail 120x120^ \
  -background black \
  -gravity center \
  -extent 120x120 \
  'downloads/*.png'


# this command resizes to 128x128, chopping what doesn't fit
mogrify -resize 60x80 *.jpg
mogrify -resize 60x80 *.png
mogrify -resize 60x80 *.gif
cd resized
mogrify -extent 60x80 -gravity center -fill white *.jpg[60x80]
mogrify -extent 60x80 -gravity center -fill white *.png[60x80]
mogrify -extent 60x80 -gravity center -fill white *.gif[60x80]
cd ../