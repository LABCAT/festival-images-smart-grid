#!/bin/bash

# show commands and stop if there is an error
set -ex

# this command makes a single image of whatever was not deleted
montage \
	-tile 20x100 \
	-geometry +0+0 \
	'resized/*.jpg' \
	montage.jpg