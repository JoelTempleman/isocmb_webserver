# Installation Overview
This project is intended as a learning project covering several topics. Each part can be auto-installed by following the direction and running the scripts, or the phases can be broken down and each step explored and explained.

# Contributors: ISOC Manitoba Chapter & MERLIN Networks - Started 5 December 2020

# The general phases are:
Preparing the equipment: a) find an appropriate project server. 

Flashing the base OS: The server will need a base operating system installed.

Install: To install the project software on the server and configure with custom code.

Docker up: Start the multiple virtual servers.

Test and modify: Troubleshooting and corrections may be required.

# Detailed Instructions
Part 1. Set up the project server
I used a Dell Precision T3400 Intel Quad Core 2.4GHz Tower Workstation - 4GB RAM

Format the computer with the base OS and identify the user
a) I used https://www.balena.io/etcher/ to flash the USB with ubuntu-20.04.1-live-server-amd64.iso onto the hardware.

b) Insert the USB drive into the server and boot it up. Follow the instructions on the screen.

c) When prompted, make the username: “isocmb”. This will make the file path /home/isocmb/…

Note: Do not install OpenSSH during setup process and don't choose any of the add-ons
d) Reboot and login. Note: There will be a bunch of information displayed. You should see the current IP address. Write that down so you can SSH into it later.

	Type:	sudo apt update && sudo upgrade upgrade -y

e) Install SSH Server:

	Type:	sudo apt-get install openssh-server -y
		sudo systemctl status ssh 		# You should get a response of "Active: active (running)"
		If the ssh server isn't running try:
			sudo systemctl enable ssh	# Only needed if not already running
			sudo systemctl start ssh	# Only needed if not already running
		
f) Connect the server to the Git Hub repository. Now that SSH is established, it will be easiest to use a different computer on the network with Internet connectivity. This way you can cut and paste commands from this and other instructions into the server. This is quicker and avoids typos.

g) From another computer, use SSH to access the server. I am using a computer running the Windows OS and the software "Bitvise SSH Client" (https://www.bitvise.com/ssh-client-download) so I can cut and paste. On a Mac, you can just use the terminal window and command "ssh connectin@IP-ADDRESS" # Use the password you used when installing the OS:

	sudo -s		# Move to root power or it won't connect properly!
	
h) Follow these instructions and if you run into problems, check out the directions to connect the server to GitHub via SSH https://help.github.com/en/github/authenticating-to-github/about-ssh

	ssh-keygen -t rsa -b 4096 -C "your@email.com" # Just hit enter at the prompt three times to get the defaults.
	eval "$(ssh-agent -s)"
	ssh-add ~/.ssh/id_rsa
	cat ~/.ssh/id_rsa.pub    		# This will show the public encryption key. Copy the text.

i) Go to your GitHub account in the web browser. Login. Go to Settings under the user profile. Go to SSH and GPG Keys. Click "New SSH key". Give it a title to identify the key. Paste the key into the space marked "Key". Click "Add SSH Key".

See the instructions on creating your own spin off version of this project if you plan to customize it. If you just want 
an exact copy of my project, you can make a replica if you just clone the current directory with the command:

“git clone git@github.com:JoelTempleman/isocmb_webserver.git”	# See below on the commands needed to connect to the Git Hub repository

	cd /		# Go to the root directory! 
			# This is required to put the project files in the correct location
			
	git clone git@github.com:JoelTempleman/isocmb_webserver.git
	cd /isocmb_webserver
	chmod +x install_project.sh
	./install_project.sh -y
  
j) The "install_project.sh" script will do a few things for you.

a)	It does a "git pull" command which copies all the files in the Git Hub repository into the folder /ConnectedMB

b)	It copies the appropriate files into the /home/connectin. This includes the project configuration files and webpages. *(More about this later.)

c)	Last, it installs Docker-compose and run the docker-compose file. This action will spin up all the required servers. *(More about this later.)
k) From the remote computer, log into http://IP-ADDRESS-OF-SERVER (ex. http://192.168.1.100 )
