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
  --tile 12x6 \
  --input-glob 'resized/*' \
  --left-image 'resized/29516311783_87657c243a.jpg' \
  --right-image 'resized/33488098312_91556220b5_z.jpg' \
  --output-path customgrid

