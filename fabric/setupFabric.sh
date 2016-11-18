#! /bin/bash


if [ xroot != x$(whoami) ]
then
   echo "You must run as root (Hint: sudo su)"
   exit
fi

apt-get update

apt-get install curl -y
apt-get install git -y

wget -qO- https://get.docker.com/ | sh 
sudo service docker stop
nohup sudo docker daemon --api-cors-header="*" -H tcp://0.0.0.0:2375 -H unix:///var/run/docker.sock&

curl -L https://github.com/docker/compose/releases/download/1.9.0-rc3/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
docker-compose --version

docker pull crazybit/hyperledger-fabric \
    && docker tag crazybit/hyperledger-fabric hyperledger/fabric-peer:latest \
    && docker tag crazybit/hyperledger-fabric hyperledger/fabric-baseimage:latest \
    && docker tag crazybit/hyperledger-fabric hyperledger/fabric-membersrvc:latest

cd pbft
docker-compose up
