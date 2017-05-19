#!/bin/bash

# show commands and stop if there is an error
set -ex

# this command makes a single image of whatever was not deleted
### Step by Step Process
bash collect-from-flickr.sh festival
bash remove-query-strings.sh
bash remove-unwanted-images-3.sh
# manually curate the images downloaded
bash resize-3.sh
echo "Hit <control>-C now if you want to clean up the images"
sleep 5
bash customgrid.sh
bash preview.sh customgrid