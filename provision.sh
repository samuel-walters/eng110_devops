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

# Allows us to edit the file at /etc/nginx/sites-available/default
sudo chown vagrant: /etc/nginx/sites-available/.

# Deletes lines 44-46 in the default file we now have permission to
sed '44,46d' /etc/nginx/sites-available/default -i
# inserts all the necessary lines in the default file to set up a reverse proxy for nginx
awk 'NR==44{print "             proxy_pass http://localhost:3000;"}7' /etc/nginx/sites-available/default > change && mv change /etc/nginx/sites-available/default
awk 'NR==45{print "             proxy_http_version 1.1;"}7' /etc/nginx/sites-available/default > change && mv change /etc/nginx/sites-available/default        
awk 'NR==46{print "             proxy_set_header Upgrade $http_upgrade;"}7' /etc/nginx/sites-available/default > change && mv change /etc/nginx/sites-available/default
awk 'NR==47{print "             proxy_set_header Connection 'upgrade';"}7' /etc/nginx/sites-available/default > change && mv change /etc/nginx/sites-available/default
awk 'NR==48{print "             proxy_set_header Host $host;"}7' /etc/nginx/sites-available/default > change && mv change /etc/nginx/sites-available/default   
awk 'NR==49{print "             proxy_cache_bypass $http_upgrade;"}7' /etc/nginx/sites-available/default > change && mv change /etc/nginx/sites-available/default

# Restores the permissions we changed to edit the default file
sudo chown root: /etc/nginx/sites-available/.
sudo chown root: /etc/nginx/sites-available/default

# restarts nginx as we have changed the default file
sudo systemctl restart nginx

# Changes the directory to where we want to install the dependencies 
cd app/app
# Installs python dependencies
sudo apt-get install python-software-properties -y
# Gets version 6
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
# Installs nodejs
sudo apt-get install -y nodejs