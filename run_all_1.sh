#!/bin/bash

# show commands and stop if there is an error
set -ex

# this command makes a single image of whatever was not deleted
### Step by Step Process
bash collect-from-snapzilla.sh
bash remove-query-strings.sh
# manually curate the images downloaded
bash resize-1.sh
echo "Hit <control>-C now if you want to clean up the images"
sleep 5
bash smartgrid.sh
bash preview.sh smartgrid