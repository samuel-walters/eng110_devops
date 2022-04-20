# Creating an automated bash script for Vagrant

> 1. Create the bash script using the command `touch provision.sh`.
> 2. Edit the file using `nano provision.sh`.
> 3. The first line should be `#!/bin/bash`. This line lets the OS know
that this file is going to be a bash script.
> 4. Underneath the first line, add the following:

    `sudo apt-get update -y` - Run updates

    `sudo apt-get upgrade -y` - Run upgrades

    `sudo apt-get install nginx -y` - install nginx

    `sudo systemctl start nginx` - Start nginx

    `sudo systemctl enable nginx` - Enable nginx

> 5. - Press ctrl + x, hit y, and press enter.

> 6. Type in `sudo chmod +x provision.sh` to make the file executable.

> 7. We need to run our script when we type in `vagrant up` in the console. To do this, we have to edit the vagrant file, informing it that once we type in `vagrant up` it should run our local script inside the virtual machine (VM). Therefore, make sure your vagrant file contains the line `config.vm.provision "shell", path: "provision.sh"` as shown below:

    Vagrant.configure("2") do |config|
        # creating a virtual machine ubuntu 
        config.vm.box = "ubuntu/xenial64"
        # create a private network with provided ip address
        config.vm.network "private_network", ip: "192.168.10.100"
        
        # trigger --> after typing vagrant up, these lines will run
        config.trigger.after :up do |trigger|
            config.vm.provision "shell", path: "provision.sh"
        end
    end
