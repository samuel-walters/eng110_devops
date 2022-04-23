# Provision Task

## Bash script

> 1. Create a bash script using the command `touch provision.sh`.
> 2. Edit the file using `nano provision.sh`.
> 3. The first line should be `#!/bin/bash`. This line lets the OS know
that this file is going to be a bash script.
> 4. Underneath the first line, add these commands in the order shown:

* `sudo apt-get update -y` - Run updates. the `-y` means any notifications
of whether you want to continue will be met with a yes.

* `sudo apt-get upgrade -y` - Run upgrades.

* `sudo apt-get install nginx -y` - Install nginx.

* `sudo systemctl start nginx` - Start nginx.

* `sudo systemctl enable nginx` - Enable nginx.

* `sudo chown vagrant: /etc/nginx/sites-available/.` - Allows us to edit a nginx file so we can set up a reverse proxy.

* `sed '44,46d' /etc/nginx/sites-available/default -i` - Deletes lines 44-46 of this file we now have permission to edit. 

* The below commands insert lines into the same file using the `awk` command:

        awk 'NR==44{print "             proxy_pass http://localhost:3000;"}7' /etc/nginx/sites-available/default > change && mv change /etc/nginx/sites-available/default
        awk 'NR==45{print "             proxy_http_version 1.1;"}7' /etc/nginx/sites-available/default > change && mv change /etc/nginx/sites-available/default        
        awk 'NR==46{print "             proxy_set_header Upgrade $http_upgrade;"}7' /etc/nginx/sites-available/default > change && mv change /etc/nginx/sites-available/default
        awk 'NR==47{print "             proxy_set_header Connection 'upgrade';"}7' /etc/nginx/sites-available/default > change && mv change /etc/nginx/sites-available/default
        awk 'NR==48{print "             proxy_set_header Host $host;"}7' /etc/nginx/sites-available/default > change && mv change /etc/nginx/sites-available/default   
        awk 'NR==49{print "             proxy_cache_bypass $http_upgrade;"}7' /etc/nginx/sites-available/default > change && mv change /etc/nginx/sites-available/default

* The below commands restore the permissions we changed to edit the default file:

        sudo chown root: /etc/nginx/sites-available/.
        sudo chown root: /etc/nginx/sites-available/default

* Restarts nginx as we have changed the default file - `sudo systemctl restart nginx`.

* `cd app/app` - Change directory to the app folder. This is where we will install our dependencies.

* `sudo apt-get install python-software-properties -y` - Installs python dependencies.

* Gets version 6 - `curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -`.

* `sudo apt-get install -y nodejs` - Installs nodejs.

> 5. - Press ctrl + x, hit y, and press enter.

> 6. Type in `sudo chmod +x provision.sh` to make the file executable.

## Vagrantfile

> 1. In your Vagrantfile, make sure to include these lines under `Vagrant.configure("2") do |config|`:

* `config.vm.box = "ubuntu/xenial64"` - Creates a virtual machine.

* `config.vm.network "private_network", ip: "192.168.10.100"` - Sets up a private network.

* `config.vm.synced_folder ".", "/home/vagrant/app"` - Transfers data from localhost to VM.

* `config.trigger.after :up do |trigger|` - When vagrant up gets typed in the terminal, the below lines will run.

* `config.vm.provision "shell", path: "provision.sh"` - Runs the provision.sh script inside the VM.

* Ensure you format the file correctly and insert two instances of `end` after all the lines have been typed, as so:

        Vagrant.configure("2") do |config|
            config.vm.box = "ubuntu/xenial64"
            config.vm.network "private_network", ip: "192.168.10.100"
            config.vm.synced_folder ".", "/home/vagrant/app"
            config.trigger.after :up do |trigger|
                config.vm.provision "shell", path: "provision.sh"
            end
        end

> 2. Type `vagrant up` in console and wait for it to finish.

> 3. Type `vagrant ssh` in console.

> 4. Inside your VM, navigate using the `cd` command to where you want to install and start `npm`.

> 5. Once in the directory, install `npm` using the command `npm install`. Start it by typing in the command `npm start`.

## Ruby Tests and Checking the Webpage

> 1. In your localhost, navigate to where the tests are written using the `cd` command.

> 2. Run the tests using `rake spec`. You must have Ruby installed for this to work. If you do not have Ruby installed, type in `gem install bundler`.

> 3. Access the Fibonacci page by typing in `192.168.10.100/fibonacci/6` in your browser. You will not need to put in the port because if you followed the steps we used nginx to set up a reverse proxy.