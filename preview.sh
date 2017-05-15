#!/bin/bash

# show commands and stop if there is an error
set -ex

# NOTE: uncomment one of the following lines:
cp customgrid/grid.jpg montage.jpg
# cp colorgrid/grid.jpg montage.jpg
# cp smartgrid/grid.jpg montage.jpg

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