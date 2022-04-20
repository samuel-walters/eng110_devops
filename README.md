# What is DevOps

DevOps is a combination of cultural philosophies, practices and tools that
allow a company to shorten its software development lifecycle (SDL) while still
providing high-quality software through the processes of continuous integration
and continuous deployment.

## Why DevOps

Traditionally, there were two separate teams which handled software development and
IT operations. However, this led to silos where the two teams started blaming one another
whenever problems arose. DevOps bridges this gap between the teams, eliminating blame
culture as everyone will be united under one single team. The lack of friction ensures 
everyone can really focus upon what is important: releasing and maintaining high-quality
software at a competitive pace.

### Benefits of DevOps

* Ensures the release of high-quality software at a fast pace due to the use of automated
tools and the elimination of silos. 
* A member of the DevOps team can oversee the whole software development lifecycle,
meaning there is someone who always has the bigger picture in mind so they can accurately
assess whether the the needs of the customer are being met.
* Automation leaves more room for innovation. As flaws get repeatedly tested through 
automation, there is more time to frame new ideas and enhance existing user features. 

#### DevOps Four Key Pillars

* Ease of use

Automation is the soul of DevOps. No time has to be wasted on traditionally difficult and time-consuming tasks. 

* Flexibility 

Having an ability to extend and replace the existing tool sets, DevOps teams can easily adapt
to the situation at hand.

* Robustness

DevOps allows an environment for seamless communication to exist since it unites what were once
two separate teams. This means individual members can overcome any problems they may face by sharing
them quickly and effortlessly with the rest of the group.

Furthermore, by being willing to pick up new automated tools and replace old technologies, a DevOps team 
can quickly adapt to any challenges they face. 

* Cost-effective

DevOps reduces the cost of computation by ensuring the company only pays for resources when they are using them. 
They can do this by leveraging serverless infrastructure like AWS Lambda or GCP Functions.

Moreover, automation cuts down on the costs associated with the volume of manual work as the DevOps team can
use automated tools and work seamlessly with one another to build, test and deploy faster than previously possible. 

### Vagrant commands

- Creates and configures guest machines according to your vagrantfile - `vagrant up`
- Stops the running machine Vagrant is currently managing and destroys all resources that were created during the machine creation process - `vagrant destory`
- Shuts down the running machine Vagrant is managing - `vagrant halt`
- If the vagrant file gets changed, use `vagrant reload`. If this does not work,
use `vagrant destroy` and then `vagrant up`.
- You can type `vagrant` in git bash to get all the commands.

### Linux commands - Ubuntu distro
- update (connect to the internet) - `sudo apt-get update`
- upgrade (-y means it will complete automatically without stopping and asking whether you want to continue) - `sudo apt-get upgrade -y`
- Who am I (which machine am I using) - `uname`. More information: `uname -a`.
- Where am I? `pwd` - shows your present working directory 
- How to check files/folders in existing location `ls` or `ls -a` (a means all - shows all hidden files/folders as well - hidden files/folders have a dot before their name)
- How to create dir `mkdir dir_name`
- navigate to any folder - change directory `cd folder_name`
- How to change back to the former location. One step back --> `cd..`
Home location --> `cd` enter
- How to create a film `touch file_name` or `nano file_name` (nano is an editor - it will create the file if it does not exist)
- To see the content of the file on terminal `cat file_name`
- How to copy file `cp location_file_name destination_path`
- To copy and paste a file somewhere, it is `mv location_file_name destination_path`
- For the above two commands, if you are in the directory where the file/folder you want to move is, and if the destination path is also found in that directory, you do not need to provide the absolute location (e.g. something like /home/test/eng110 etc.) Instead, you can just provide the file/folder name.
- How to delete folders `rm -rf folder_name` (-rf forces the deletion)
- How to check running process in linux `top` or `ps aux`
- How to delte/remove/kill any process `kill pid`

### Permissions

- how to check permissions `ll`
- how to switch to `root user` ---> `sudo su`
root user is dangerous. there will be no prompts/noifications, you
could destroy data suddenly. do exit to go back to user
- how to change permissions `chmod instruction file_name`
- processes: timeout 30s ping www.google.com
- How to install a product `install webserver called nginx`
- `sudo apt-get install package_name`
How to check the `status` - `systemctl status nginx`
- put in the line `config.vm.network "private_network", ip: "192.168.10.100"` in your vagrant file
- `vagrant reload`
- put in the ip in your browser

### bash script - set of commands/instructions

- file name must end in .sh
- put `#!/bin/bash` at the start otherwise it won't work (it won't
even know it's a bash script)
- put in linux commands
- press ctrl + x, hit y, and press enter
- type in `sudo chmod +x filename.sh` to make it executable.
- to run the script, type `sudo ./provision.sh` (if you are in
the same directory as the script)