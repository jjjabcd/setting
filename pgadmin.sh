#!/bin/bash

set -e  # Exit immediately if a command fails

echo "== Step 1: Add pgAdmin repository and public key =="

# Add GPG key
curl -fsS https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo gpg --dearmor -o /usr/share/keyrings/packages-pgadmin-org.gpg

# Add APT repository
sudo sh -c 'echo "deb [signed-by=/usr/share/keyrings/packages-pgadmin-org.gpg] https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list'

# Update package list
sudo apt update

echo "== Step 2: Install pgAdmin 4 =="

sudo apt install -y pgadmin4

sudo apt install -y pgadmin4-desktop

sudo apt install -y pgadmin4-web
sudo /usr/pgadmin4/bin/setup-web.sh

echo "== pgAdmin installation complete =="