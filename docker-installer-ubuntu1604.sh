#!/bin/bash
# Install docker in ubuntu 16.04

# Update your apt sources
sudo apt-get update
sudo apt-get install --assume-yes apt-transport-https ca-certificates
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo touch /etc/apt/sources.list.d/docker.list
sudo chmod 777 /etc/apt/sources.list.d/docker.list
echo 'deb https://apt.dockerproject.org/repo ubuntu-xenial main' >> /etc/apt/sources.list.d/docker.list

# Install linux-image-extra
sudo apt-get update
sudo apt-cache policy docker-engine
sudo apt-get install --assume-yes linux-image-extra-$(uname -r)

# Install docker-engine
sudo apt-get update
sudo apt-get install --assume-yes --allow-unauthenticated docker-engine
sudo service docker start

# To create the docker group and add your user
sudo usermod -aG docker `whoami`
sudo usermod -aG docker jenkins
