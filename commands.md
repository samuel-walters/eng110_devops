# Vagrant commands

- Creates and configures guest machines according to your vagrantfile - `vagrant up`.
- Stops the running machine Vagrant is currently managing and destroys all resources that were created during the machine creation process - `vagrant destory`.
- Shuts down the running machine Vagrant is managing - `vagrant halt`.
- If the vagrant file gets changed, use `vagrant reload`. If this does not work,
use `vagrant destroy` and then `vagrant up`.
- You can type `vagrant` in GitBash to get all the commands.

# Linux commands - Ubuntu distro
- Update (connect to the internet) - `sudo apt-get update`.
- Upgrade (-y means it will complete automatically without stopping and asking whether you want to continue) - `sudo apt-get upgrade -y`.
- Who am I (which machine am I using)? - `uname`. 
- For even more information: `uname -a`.
- Where am I? `pwd` - shows your present working directory 
- How to check files/folders in existing location `ls` or `ls -a` (-a means all - shows all hidden files/folders as well - hidden files/folders have a dot before their name).
- How to create directory/folder - `mkdir dir_name`
- Navigate to any folder - change directory `cd folder_name`.
- How to change back to the former location. One step back --> `cd..`
- Home location --> `cd` enter.
- How to create a file `touch file_name` or `nano file_name` (nano is an editor - it will create the file if it does not exist).
- To see the content of the file on terminal `cat file_name`.
- How to copy file `cp location_file_name destination_path`.
- To copy and paste a file somewhere, it is `mv location_file_name destination_path`.
- For the above two commands, if you are in the directory where the file/folder you want to move is, and if the destination path is also found in that same directory, you do not need to provide the absolute location (e.g. something like /home/test/eng110 etc.) Instead, you can just provide the file/folder names.
- How to delete folders `rm -rf folder_name` (-rf forces the deletion).
- How to check running process in linux `top` or `ps aux`.
- How to delte/remove/kill any process `kill pid`.

### Permissions

- How to check permissions `ll`.
- How to switch to `root user` ---> `sudo su`.
- Root user is dangerous. There will be no prompts/notifications. You
could destroy data suddenly. Type exit to go back to user.
- How to change permissions - `chmod instruction file_name`.
- Processes: `timeout 30s ping www.google.com`.

### Setting up nginx
- Installing the product - `install webserver called nginx`.
- `sudo apt-get install package_name`.
- Check the `status` - `systemctl status nginx`.
- Put in the line `config.vm.network "private_network", ip: "192.168.10.100"` in your vagrant file.
- `vagrant reload`.
- Put in the ip in your browser.

# Bash script

- File name must end in .sh.
- Put `#!/bin/bash` at the start otherwise it won't work (it won't
even know it's a bash script).
- Put in linux commands.
- Press ctrl + x, hit y, and press enter.
- Type in `sudo chmod +x filename.sh` to make it executable.
- To run the script, type `sudo ./provision.sh` (if you are in
the same directory as the script).