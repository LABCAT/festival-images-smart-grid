#!/bin/bash

if [ -d "/usr/local/anaconda/extras" ]; then
  # Control will enter here if DIRECTORY doesn't exist.
  echo "smartgrid program already installed"
  exit 1
fi

# show commands and stop if there is an error
set -ex

# make the directory if it is not there
mkdir -p /tmp/smartgrid

# clean the directory if there are old results
rm -f /tmp/smartgrid/*

cd /tmp/smartgrid
wget http://deeptom.staff.vuw.ac.nz:9000/smartgrid.tgz
cd /usr/local
tar xvfz /tmp/smartgrid/smartgrid.tgz

echo "DONE: smartgrid program installed"
