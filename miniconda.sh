#!/bin/bash

set -e  # Exit on any error

INSTALLER=Miniconda3-latest-Linux-x86_64.sh
INSTALL_PATH="$HOME/rlawlsgurjh/work/miniconda"

echo "== Step 0: Create target install path if not exists =="
mkdir -p "$INSTALL_PATH"

echo "== Step 1: Download Miniconda installer =="
wget -nc https://repo.anaconda.com/miniconda/$INSTALLER

echo "== Step 2: Make installer executable =="
chmod +x $INSTALLER

echo "== Step 3: Install Miniconda (no prompt) =="
bash ./$INSTALLER -b -p "$INSTALL_PATH"

echo "== Step 4: Initialize conda in .bashrc =="
eval "$($INSTALL_PATH/bin/conda shell.bash hook)"
conda init bash

echo "== Miniconda installation complete =="
echo "Please restart your shell or run 'source ~/.bashrc'"