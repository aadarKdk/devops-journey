#!/bin/bash

# Exit on any error
set -e

# Update package list and install apache2
echo "[INFO] Updating package list..."
sudo apt-get update

echo "[INFO] Installing apache2..."
sudo apt-get install -y apache2

# Start and enable apache2 service
echo "[INFO] Starting and enabling apache2..."
sudo systemctl enable apache2
sudo systemctl start apache2

# Creating a test HTML file
echo "[INFO] Creating test index.html..."
echo "provision1.sh ran successfully!" | sudo tee /var/www/html/index.html

# Restart apache2 service to ensure changes are loaded 
sudo systemctl restart apache2

echo "[SUCCESS] apache2 provisioned and index page created."

