# Provision Task

## Bash script

> 1. Create a bash script using the command `touch provision.sh`.
> 2. Edit the file using `nano provision.sh`.
> 3. The first line should be `#!/bin/bash`. This line lets the OS know
that this file is going to be a bash script.
> 4. Underneath the first line, add these commands in the order shown:

* `sudo apt-get update -y` - Run updates. the `-y` means any notifications
of whether you want to continue will be met with a yes.

* `sudo apt-get upgrade -y` - Run upgrades

* `sudo apt-get install nginx -y` - install nginx

* `sudo systemctl start nginx` - Start nginx

* `sudo systemctl enable nginx` - Enable nginx

* `cd app` - Change directory to the app folder

* `cd app` - Same as above (this new app folder is inside the other app folder -
and we change directory because we want to install our dependencies here).

* `sudo apt-get install python-software-properties -y` - Installs python dependencies

* `curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -` - Gets version 6

* `sudo apt-get install -y nodejs` - Installs nodejs

> 5. - Press ctrl + x, hit y, and press enter.

> 6. Type in `sudo chmod +x provision.sh` to make the file executable.

## Vagrantfile

> 1. In your Vagrantfile, make sure to include these lines under `Vagrant.configure("2") do |config|`:

* `config.vm.box = "ubuntu/xenial64"` - Creates a virtual machine.

* `config.vm.network "private_network", ip: "192.168.10.100"` - Sets up a private network.

* `config.vm.synced_folder ".", "/home/vagrant/app"` - Transfers data from localhost to VM.

* `config.trigger.after :up do |trigger|` - When vagrant up gets typed in the terminal, the
below lines will run.

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

> 5. Once in the directory, install `npm` using the command `install npm`. Start it by typing in the command `start npm`.

## Ruby Tests and Checking the Webpage

> 1. In your localhost, navigate to where the tests are written using the `cd` command.

> 2. Run the tests using `rake spec`. You must have Ruby installed for this to work. If you do not have Ruby installed, type in `gem install bundler`.

> 3. Access the Fibonacci page by typing in `192.168.10.100:3000/fibonacci/6` in your browser.