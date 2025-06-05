#!/bin/bash

apt update
apt install -y apache2 php libapache2-mod-php php-mysql wget unzip

# Download and set up WordPress
wget https://wordpress.org/latest.zip
unzip latest.zip
rm latest.zip
mv wordpress /var/www/html/wordpress

# Set permissions
chown -R www-data:www-data /var/www/html/wordpress

# Configure Apache virtual host
cat <<EOL > /etc/apache2/sites-available/wordpress.conf
<VirtualHost *:80>
    ServerAdmin admin@web
    ServerName 192.168.56.6
    DocumentRoot /var/www/html/wordpress
    <Directory /var/www/html/wordpress>
        AllowOverride All
    </Directory>
    ErrorLog \${APACHE_LOG_DIR}/error.log
    CustomLog \${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
EOL

# Enable the site and modules
a2ensite wordpress.conf
a2dissite 000-default.conf
a2enmod rewrite

# Fix Apache FQDN warning
echo "ServerName 192.168.56.6" >> /etc/apache2/apache2.conf

systemctl reload apache2


