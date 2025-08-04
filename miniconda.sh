#!/bin/bash

set -e  # Exit on any error

INSTALLER="Miniconda3-latest-Linux-x86_64.sh"
DOWNLOAD_DIR="$HOME/work"
INSTALLER_PATH="$DOWNLOAD_DIR/$INSTALLER"
INSTALL_PATH="$HOME/work/miniconda"

echo "== Step 0: Create target directories if not exists =="
mkdir -p "$DOWNLOAD_DIR"
mkdir -p "$INSTALL_PATH"

echo "== Step 1: Download Miniconda installer =="
cd "$DOWNLOAD_DIR"
wget -nc "https://repo.anaconda.com/miniconda/$INSTALLER"

echo "== Step 2: Make installer executable =="
chmod +x "$INSTALLER"

echo "== Step 3: Install Miniconda (no prompt) =="
bash "$INSTALLER" -b -p "$INSTALL_PATH" -u

echo "== Step 4: Initialize conda in .bashrc =="
eval "$($INSTALL_PATH/bin/conda shell.bash hook)"
conda init bash

source ~/.bashrc