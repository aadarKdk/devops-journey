#!/bin/bash


sudo apt update
sudo apt install apache2 -y
echo "Hello World!, Let's learn Terraform" > /var/www/html/index.html

sudo systemctl restart apache2

