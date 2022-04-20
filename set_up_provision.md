# Creating an automated bash script for Vagrant

> 1. Create the bash script using the command `touch provision.sh`.
> 2. Edit the file using `nano provision.sh`.
> 3. Fill the file as so - pay attention to the comments:

    #!/bin/bash
    # The above line communicates with the OS that this is going to be a bash script
    # Run updates
    sudo apt-get update -y
    # Run upgrades
    sudo apt-get upgrade -y
    # Install nginx
    sudo apt-get install nginx -y
    # Start nginx
    sudo systemctl start nginx 
    # Enable nginx
    sudo systemctl enable nginx 

> 4. We need to run our script when we type in `vagrant up` in the console. To do this, we have to edit the vagrant file, informing it that once we type in `vagrant up` it should run our local script inside the VM. Make sure your vagrantfile has these lines:

    Vagrant.configure("2") do |config|

        config.vm.box = "ubuntu/xenial64"
        # creating a virtual machine ubuntu 
        # create a private network with provided ip address
        config.vm.network "private_network", ip: "192.168.10.100"
        
        # trigger --> after typing vagrant up, these lines will run
        config.trigger.after :up do |trigger|
            config.vm.provision "shell", path: "provision.sh"
        end
    end
