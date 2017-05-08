#!/bin/bash

# show commands and stop if there is an error
set -ex

# this command makes a single image of whatever was not deleted
bash collect.sh
bash resize.sh
echo "Hit <control>-C now if you want to clean up the images"
sleep 5
bash smartgrid.sh
bash preview.sh