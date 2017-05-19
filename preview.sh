#!/bin/bash

# show commands and stop if there is an error
set -ex

# NOTE: uncomment one of the following lines:
# cp colorgrid/grid.jpg montage.jpg
# cp smartgrid/grid.jpg montage.jpg
cp $1/grid.jpg montage.jpg

# this is just for the final versino
cp $1/*.png .
cp $1/left_right.jpg .

# convert montage to preview shaped image
convert montage.jpg \
    -resize "960x500^" \
    -gravity center \
    -crop 960x500+0+0 \
    +repage preview.jpg

# convert preview to thumbnail image
convert preview.jpg \
    -resize 50% \
    -gravity center \
    -crop 230x120+0+0 \
    +repage thumbnail.png