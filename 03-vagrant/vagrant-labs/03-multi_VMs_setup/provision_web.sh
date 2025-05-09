#!/bin/bash

set -e

echo "[INFO] Provisioning web server (Ubuntu)..."

# Install Apache2
sudo apt-get update
sudo apt-get install -y apache2

# Create a simple index.html page
echo "<h1>Apache Server is running on Ubuntu!</h1>" | sudo tee /var/www/html/index.html

# Enable and start Apache service
sudo systemctl enable apache2
sudo systemctl start apache2

echo "[SUCCESS] Web server provisioned successfully."

