#!/bin/bash

set -e  # Stop on error

echo "== Step 1: Update and install base packages =="
sudo apt update
sudo apt install -y git gnome-terminal ca-certificates curl gnupg lsb-release
sudo apt install pip
sudo apt install make

echo "== Step 2: Set up Docker repository key =="
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo tee /etc/apt/keyrings/docker.asc > /dev/null
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo "== Step 3: Add Docker APT repository =="
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "== Step 4: Install Docker engine and Compose plugin =="
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "== Step 5: Verify Docker installation =="
sudo docker run hello-world

echo "== Step 6: Install Python packages for ASKCOS =="
pip install --upgrade pip
pip install pyyaml requests

echo "== Step 7: Add user to docker group =="
sudo usermod -aG docker $USER
echo "You must log out and log back in (or run 'newgrp docker') for group changes to take effect."








echo "== All done. ASKCOS core deployed. =="
