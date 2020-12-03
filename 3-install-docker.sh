#!/bin/bash
print () {
 echo  "\e[1m\e[34m>>> $1\e[39m\e[0m"
}

print "Installing docker"
# Uninstall old versions
sudo apt-get remove docker docker-engine docker.io containerd runc
#Update the apt package index and install packages to allow apt to use a repository over HTTPS:
sudo apt-get update
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
# Add Docker’s official GPG key:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# Use the following command to set up the stable repository
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
# And finally install it
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
print "done"

print "Post installation steps"
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
docker run hello-world
print "All done!"
