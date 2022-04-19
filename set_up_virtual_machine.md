# Step 1 - Install Ruby

## Windows Users

Paste the following link in your browser:

https://github.com/oneclick/rubyinstaller2/releases/download/RubyInstaller-2.6.6-1/rubyinstaller-devkit-2.6.6-1-x64.exe

## Mac Users

Paste the following link in your browser:

https://www.ruby-lang.org/en/downloads/

## Important information

***Ensure to download x64 for your OS***

Check your version in gitbash by doing ruby --version. You may need to close and reopen gitbash in order for this command to work.

Ensure the version is ***2.6.6p146*** as shown below:

![](https://github.com/khanmaster/vb_vagrant_installtion/raw/master/images/ruby_version.png)

# Step 2 - Install Vagrant

[Download vagrant](https://www.vagrantup.com/). Make sure you pick *your* OS and follow the instructions below for your OS (if it shows):

***Windows Users***: Go to Windows features on or off, and disable Hyper-V.

***Mac Users***: go to system preferences. In Privacy and Security, approve the update from Oracle.

Once done, in git bash type vagrant --version. This should return "Vagrant 2.2.7". Close and reopen gitbash if it does not work.

# Step 3 - Install Virtualbox

[Download VirtualBox](https://www.virtualbox.org/wiki/Downloads). Ensure you install the 6.1 version. 

### Windows Users only

> 1. If `C:\ProgramFiles\Oracle\VirtualBox\drivers\vboxdrv` does exist, navigate to it. If it does not exist, do not worry, and proceed straight to step 3.
> 2. Right click on the ***VBoxDrv.inf*** Setup Information file and and select Install
> 3. Open up Windows PowerShell ***as an administrator***, and type in `sc start vboxdrv` and click enter. Exit powershell.
> 4. Go to ***Control Panel***. From there go to ***Network and Internet***. Click ***Network and Sharing Centre***, then click ***Change Adapter Settings*** on the left-hand side.
> 5. Right click on ***VirtualBox Host-Only Network*** and choose **Properties**
> 6. Click on ***Install.*** Then click on ***Service***
> 7. On the left-hand side, choose ***Oracle Corporation***. Click ***VirtualBox NDIS6 Bridged Networking driver***.

# Step 4 - Creating our virtual environment 

> 1. Create a new folder with an empty file inside called `vagrantfile` (no extension).
> 2. Inside this new file, copy and paste the following lines:

```
Vagrant.configure("2") do |config|

 config.vm.box = "ubuntu/xenial64"
# creating a virtual machine ubuntu 

end
```
> 3. In gitbash, ***in the same directory you have created the vagrantfile inside***, type `vagrant run` and hit enter.
> 4. This command may take a while to run. It depends on your computer. You should receive the following output:

![](https://github.com/khanmaster/vb_vagrant_installtion/blob/master/images/vagrantup_result.png)

> 5. After the command has finished, `type vagrant status` and hit enter. If you see the following output, it means you have done well so far:

![](https://github.com/khanmaster/vb_vagrant_installtion/blob/master/images/vagrant_status.png)

> 6. Type vagrant ssh to connect to your virtual machine. Once inside, try typing `sudo apt-get update` to connect to the internet.