#!/bin/bash

# Update package list
apt update

# Install MySQL non-interactively
DEBIAN_FRONTEND=noninteractive apt install -y mysql-server

# Enable and start MySQL service
systemctl enable mysql
systemctl start mysql

# Wait to ensure MySQL is fully up before configuration
sleep 10

# Configure MySQL to listen on all IP addresses
sed -i "s/^bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf
systemctl restart mysql

# Configure database and user access
# Configure database and user access using socket auth
sudo mysql <<EOF
-- Set root password for local access
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'Demo@123';

-- Create database if not exists
CREATE DATABASE IF NOT EXISTS devopsdb;

-- Create user for webserver access from 192.168.56.6
CREATE USER IF NOT EXISTS 'mydbuser'@'192.168.56.6' IDENTIFIED BY 'Demo@123';

-- Grant all privileges on the devopsdb to the user from webserver IP
GRANT ALL PRIVILEGES ON devopsdb.* TO 'mydbuser'@'192.168.56.6';

-- Apply privileges
FLUSH PRIVILEGES;
EOF

