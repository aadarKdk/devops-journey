#!/bin/bash

# Define password as a variable
DB_PASSWORD="password"

# Execute SQL statements directly
sudo mysql -u root <<EOF
CREATE DATABASE wordpress;
CREATE USER 'wordpress'@'localhost' IDENTIFIED BY '${DB_PASSWORD}';
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, ALTER
ON wordpress.*
TO 'wordpress'@'localhost';
FLUSH PRIVILEGES;
EOF

