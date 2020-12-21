# Run to install from scratch. Target: Virtual Server running Ubunto 20.04 LTS
#!/bin/sh
set -x #echo on

# Script used to install Git Hub repo into the correct areas on the server
# Name: "install_project.sh" Copyright (c) Joel Templeman 2020

cd /ConnectedMB
git pull

#cp -rf /ConnectedMB/server/serverfiles/* /home/connectin/ # This will contain a clone copy of the Git Hub project

#mkdir /ConnectedMB/server/serverfiles/www/packages/ # All the files for the monitors will go here

#cp -rf /ConnectedMB/monitor/* /ConnectedMB/server/serverfiles/www/packages/ # Later, the client will use the wget command to download all these files.

#cp /home/connectin/creds.env.example /home/connectin/creds.env  # This will provide some default passwords to the virtual machines. These will be updated later.

#cd /home/connectin      # Move to the home directory and start up Docker virtual machines. 

# Install Docker and run the docker-compose instructions.
sudo apt install docker-compose -y   # This will install all the requirements to run Docker VMs.
sudo docker-compose up -d    # The -d is for "detached" so they will run in the background and still allow use of the root OS.
