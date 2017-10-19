#!/bin/bash
# Install golang in debian
# Usage: sh golang-installer-debian.sh <go_version>
# Ex: sh golang-installer-debian.sh 1.9.1

GO_VERSION=${1:-1.9.1}
echo "Install go$GO_VERSION ..."

# Update
sudo apt-get update
sudo apt-get -y upgrade

# Install packages to allow apt to use a repository over HTTPS
sudo apt-get install --assume-yes \
	curl \
	git

# Download and install
wget https://storage.googleapis.com/golang/go$GO_VERSION.linux-amd64.tar.gz
sudo tar -xvf go$GO_VERSION.linux-amd64.tar.gz
sudo rm -rf /usr/local/go
sudo mv go /usr/local

# Setup GOROOT and GOPATH
echo "GOROOT=/usr/local/go" >> $HOME/.bashrc
echo "GOPATH=$HOME/go" >> $HOME/.bashrc
echo 'PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> $HOME/.bashrc
