# Introduction to Vagrant

Vagrant is a virtual machine manager. It allows developers to use a consistent development environment so that what works on one person's machine will work the same way on another person's machine.

But vagrant not only lets you create VMs: it actually allows you to automate the work involved with setting up development environments for projects.

## How does it work?
![](https://miro.medium.com/max/826/1*wt3QFxkSjSZE5CEblJ3QQQ.png)

1. Once the Vagrantfile is created, type in `vagrant up` in GitBash and everything should be installed and configured to work.
2. If the other members of the team have the ***same content*** in their own configuration file, then they will all be working in the same environment with the same dependencies. 
3. From here, Vagrant uses VirtualBox, along with any automated scripts you might want to run once you have typed in `vagrant up`, to set up and configure the virtual machine.
4. If you want to access the machine through SSH, type in `vagrant ssh`.
