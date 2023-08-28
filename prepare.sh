#!/bin/bash
# This script is used to obtain latest release of NodeBB

WORKDIR=$HOME/nodebb
API=https://api.github.com/repos/NodeBB/NodeBB/releases/latest
DEV_DEPS="wget unzip"
REMOTE=$(curl -s $API | grep zipball_url | cut -d '"' -f 4)
VERSION=$(curl -s $API | grep tag_name | cut -d '"' -f 4)

# Show some useful information
echo "----------------------------------------"
echo "NodeBB version: $VERSION"
echo "Working directory: $WORKDIR"
echo "Remote URL: $REMOTE"
echo "----------------------------------------"

# Create working directory
rm -rf $WORKDIR
mkdir -p $WORKDIR
cd $WORKDIR

# Install dependencies, skip if SKIP_DEV_DEPS is set to 1
if [ $SKIP_DEV_DEPS -eq 0 ]; then
    sudo apt-get update
    sudo apt-get install -y $DEV_DEPS
fi

# Obtain latest release
wget $REMOTE -O nodebb.zip
unzip -qq nodebb.zip
rm nodebb.zip
mv NodeBB-NodeBB-*/* .
rm -rf NodeBB-NodeBB-*
