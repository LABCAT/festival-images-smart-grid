#!/bin/bash

# show commands and stop if there is an error
set -ex

# make the directory if it is not there
mkdir -p resized

# clean the directory if there are old results
rm -f resized/*

# this command resizes to 240x216, chopping what doesn't fit
mogrify \
  -path resized \
  -thumbnail 240x216^ \
  -background black \
  -gravity center \
  -extent 240x216 \
  'downloads/*.jpg'

mogrify \
  -path resized \
  -thumbnail 240x216^ \
  -background black \
  -gravity center \
  -extent 240x216 \
  'downloads/*.png'
