> 1. touch provision.sh
> 2. nano provision.sh
> 3. fill the file as so:

    #!/bin/bash

    sudo apt-get update -y
    sudo apt-get upgrade -y
    sudo apt-get install nginx -y
    sudo systemctl start nginx 
    sudo systemctl enable nginx 

> 4. in vagrantfile, add these lines:

    Vagrant.configure("2") do |config|

        config.vm.box = "ubuntu/xenial64"
        # creating a virtual machine ubuntu 
        # create a private network with provided ip address
        config.vm.network "private_network", ip: "192.168.10.100"
        
        config.trigger.after :up do |trigger|
            config.vm.provision "shell", path: "provision.sh"
        end
    end

