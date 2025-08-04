#!/bin/bash

set -e  # Exit on any error

ASKCOS_DIR="$HOME/$USER/work/ASKCOSv2"
CORE_REPO="git@gitlab.com:mlpds_mit/askcosv2/askcos2_core.git"

echo "== Step 1: Create ASKCOS root directory if not exists =="
mkdir -p "$ASKCOS_DIR"
cd "$ASKCOS_DIR"

if [ -d "askcos2_core" ]; then
    echo "Directory 'askcos2_core' already exists in $ASKCOS_DIR"
    echo "Delete it manually if you want to re-clone."
else
    echo "== Step 2: Clone askcos2_core repo =="
    git clone "$CORE_REPO"
fi

echo "== Step 3: Deploy ASKCOS core =="
cd "$ASKCOS_DIR/askcos2_core"
make deploy

echo "== ASKCOS core deployment complete =="
