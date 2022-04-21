#!/bin/bash

# The above line lets the OS know that this file is going to be a bash script.

# Run updates. the `-y` means any notifications of whether you want to continue will be met with a yes
sudo apt-get update -y
# Run upgrades
sudo apt-get upgrade -y
# Install nginx
sudo apt-get install nginx -y
# Start nginx
sudo systemctl start nginx
# Enable nginx
sudo systemctl enable nginx
# Changes the directory to where we want to install the dependencies 
cd app
cd app
# Installs python dependencies
sudo apt-get install python-software-properties -y
# Gets version 6
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
# Installs nodejs
sudo apt-get install -y nodejs