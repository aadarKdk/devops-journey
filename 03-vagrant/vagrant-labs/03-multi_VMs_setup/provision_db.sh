#!/bin/bash

set -e

echo "[INFO] Provisioning database server (MySQL)..."

# Update package list
sudo apt-get update

# Install MySQL Server
sudo apt-get install -y mysql-server

# Enable and start MySQL service
sudo systemctl enable mysql
sudo systemctl start mysql

# Optional: Secure MySQL installation (manual interaction skipped)
# echo "[WARNING] Run 'sudo mysql_secure_installation' manually to secure MySQL."

echo "[SUCCESS] MySQL server installed and running on Ubuntu!"

