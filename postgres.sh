#!/bin/bash

set -e  # Exit on error

echo "== Step 1: Update and upgrade packages =="
sudo apt update
sudo apt upgrade -y

echo "== Step 2: Install PostgreSQL =="
sudo apt install -y postgresql postgresql-contrib

echo "== Step 3: Enable and start PostgreSQL service =="
sudo systemctl enable postgresql
sudo systemctl start postgresql

echo "== PostgreSQL installation complete =="
echo "You can connect using: sudo -u postgres psql"