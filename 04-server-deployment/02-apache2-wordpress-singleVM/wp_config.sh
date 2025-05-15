#!/bin/bash

# Exit on error
set -e

# Define variables
DB_NAME="wordpress"
DB_USER="wordpress"
DB_PASSWORD="password"  # Replace or export securely

# Copy sample config to actual config if not already done
if [ ! -f /srv/www/wordpress/wp-config.php ]; then
    sudo -u www-data cp /srv/www/wordpress/wp-config-sample.php /srv/www/wordpress/wp-config.php
fi

# Set database credentials
sudo -u www-data sed -i "s/database_name_here/${DB_NAME}/" /srv/www/wordpress/wp-config.php
sudo -u www-data sed -i "s/username_here/${DB_USER}/" /srv/www/wordpress/wp-config.php
sudo -u www-data sed -i "s/password_here/${DB_PASSWORD}/" /srv/www/wordpress/wp-config.php

# Replace secret keys only if default placeholders exist
if grep -q "put your unique phrase here" /srv/www/wordpress/wp-config.php; then
    SALT_KEYS=$(curl -s https://api.wordpress.org/secret-key/1.1/salt/)
    sudo -u www-data sed -i "/AUTH_KEY/d;/SECURE_AUTH_KEY/d;/LOGGED_IN_KEY/d;/NONCE_KEY/d;/AUTH_SALT/d;/SECURE_AUTH_SALT/d;/LOGGED_IN_SALT/d;/NONCE_SALT/d" /srv/www/wordpress/wp-config.php
    echo "$SALT_KEYS" | sudo -u www-data tee -a /srv/www/wordpress/wp-config.php > /dev/null
fi

