#!/bin/bash

# Development on Power (ppc64le) systems is done outside of vagrant, on the
# native OS. This script helps setup the dev env on ppc64le Ubuntu.
#
# See https://github.com/hyperledger/fabric/blob/master/docs/dev-setup/install.md#building-outside-of-vagrant-
#
# NOTE: This script assumes that
#	- OS specific apt-sources / repositories are already set appropriately.
#	- Host's GOPATH environment variable is set.
#
# To get started on a fresh Ubuntu install:
#	mkdir -p $GOPATH/src/github.com/hyperledger
#	cd $GOPATH/src/github.com/hyperledger
#	git clone http://gerrit.hyperledger.org/r/fabric
#	sudo ./fabric/devenv/setupUbuntuOnPPC64el.sh
#	cd $GOPATH/src/github.com/hyperledger/fabric
#	make dist-clean all

if [ xroot != x$(whoami) ]
then
   echo "You must run as root (Hint: Try prefix 'sudo' while executing the script)"
   exit
fi

#####################################
# Install pre-requisite OS packages #
#####################################
apt-get update
apt-get -y install curl git wget

####################################
# Install Go and set env variable  #
####################################
wget https://storage.googleapis.com/golang/go1.7.linux-amd64.tar.gz
tar -xvf go1.7.linux-amd64.tar.gz
mv go /usr/local

# Set the GOROOT env variable
export GOROOT="/usr/local/go"
mkdir workspace
export GOPATH="workspace"
source /etc/profile

apt-get -y install libsnappy-dev zlib1g-dev libbz2-dev "build-essential"


#####################################
# Install and setup Docker services #
#####################################

wget -qO- https://get.docker.com/ | sh 
sudo service docker stop
nohup sudo docker daemon --api-cors-header="*" -H tcp://0.0.0.0:2375 -H unix:///var/run/docker.sock&

curl -L https://github.com/docker/compose/releases/download/1.9.0-rc3/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

mkdir -p $GOPATH/src/github.com/hyperledger/
cd $GOPATH/src/github.com/hyperledger
git clone https://github.com/hyperledger/fabric.git

