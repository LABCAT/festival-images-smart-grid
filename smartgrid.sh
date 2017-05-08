#!/bin/bash

if [ ! -d "/usr/local/anaconda/extras" ]; then
  # Control will enter here if DIRECTORY doesn't exist.
  echo "smartgrid program not found"
  echo "please first install using directions on blackboard"
  exit 1
fi

# show commands and stop if there is an error
set -ex

HOME="/usr/local/anaconda/extras/home"
export PATH="/usr/local/anaconda/bin:$PATH"

python /usr/local/anaconda/extras/smartgrid.py \
  --do-colors \
  --input-glob 'resized/*' \
  --output-path colorgrid

# this command makes a single image of whatever was not deleted
python /usr/local/anaconda/extras/smartgrid.py \
  --input-glob 'resized/*' \
  --output-path smartgrid
