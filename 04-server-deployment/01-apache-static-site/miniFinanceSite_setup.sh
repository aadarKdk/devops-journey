#!/usr/bin/env bash

set -e

# Install Apache, unzip & wget
apt-get update
apt-get install -y apache2 unzip wget

# Prepare directory
mkdir -p /home/vagrant/site
cd /home/vagrant/site

# Download mini-finance-site template
wget -q https://www.tooplate.com/zip-templates/2135_mini_finance.zip -O mini_finance.zip

# Extract contents
unzip mini_finance.zip -d mini_finance_site
rm mini_finance.zip

# Set ownership and permissions
chown -R www-data:www-data /home/vagrant/site/mini_finance_site
chmod +x /home
chmod +x /home/vagrant
chmod +x /home/vagrant/site
chmod -R 755 /home/vagrant/site/mini_finance_site

# Apache virtual host configuration
cp /vagrant/mini_finance.conf /etc/apache2/sites-available/
a2dissite 000-default.conf
a2ensite mini_finance.conf

# Restart Apache to apply changes
systemctl reload apache2

