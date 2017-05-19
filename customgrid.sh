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
  --tile 48x40 \
  --input-glob 'resized/*' \
  --left-image 'resized/15472998524_26f69c0173_n.jpg' \
  --right-image 'resized/15139800171_7191c9e8e8_n.jpg' \
  --output-path customgrid

