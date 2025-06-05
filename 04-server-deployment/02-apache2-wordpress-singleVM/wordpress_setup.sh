#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Update package list
sudo apt-get update

# Install Apache, PHP, MySQL, and required modules
sudo apt install -y apache2 \
                    ghostscript \
                    libapache2-mod-php \
                    mysql-server \
                    php \
                    php-bcmath \
                    php-curl \
                    php-imagick \
                    php-intl \
                    php-json \
                    php-mbstring \
                    php-mysql \
                    php-xml \
                    php-zip

# Prepare directory to install WordPress
sudo mkdir -p /srv/www
sudo chown www-data:www-data /srv/www

# Download and extract WordPress directly into the directory
curl https://wordpress.org/latest.tar.gz | sudo -u www-data tar zx -C /srv/www

# Copy Apache virtual host configuration for wordpress
sudo cp /vagrant/wordpress.conf /etc/apache2/sites-available/wordpress.conf

# Enable the site and URL rewriting
sudo a2ensite wordpress
sudo a2enmod rewrite 

# Disable the default site
sudo a2dissite 000-default

# Reload the apache2 to apply the changes
sudo systemctl restart apache2

# Run the db_config.sh script to create MySQL database for WordPress
bash /vagrant/db_config.sh

# Configure wordpress to connect the database
bash /vagrant/wp_config.sh



