#!/bin/bash
# Install docker in debian Jessie (x86_64)

# Update your apt sources
sudo apt-get update

# Install packages to allow apt to use a repository over HTTPS
sudo apt-get install --assume-yes \
     apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     software-properties-common

# Add Docker's official GPG key
curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | sudo apt-key add -

# Set up the stable repository
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
   $(lsb_release -cs) \
   stable"

# Install Docker CE
sudo apt-get update
sudo apt-get install --assume-yes docker-ce
# use `apt-cache madison docker-ce` get docker-ce version
sudo apt-get install --assume-yes docker-ce=17.06.2~ce-0~debian

# To create the docker group and add your user
sudo groupadd docker
sudo usermod -aG docker $USER
