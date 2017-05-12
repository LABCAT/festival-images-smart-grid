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
