#!/bin/bash

# show commands and stop if there is an error
set -ex

# this command makes a single image of whatever was not deleted
### Step by Step Process
#collect images from flickr by passing a tag to the script as an argument
bash collect-from-flickr.sh festival
#remove query string from downloaded file so they don't cause issues in other scripts
bash remove-query-strings.sh
#remove images I don't want - this doesn't work well for flickr as the results are constantly changing
bash remove-unwanted-images-3.sh
#resize the images
bash resize-3.sh
echo "Hit <control>-C now if you want to clean up the images"
sleep 5
#run the customgrid script
bash customgrid.sh
#run the preview script passing the folder name where the files are located as an argument 
bash preview.sh customgrid