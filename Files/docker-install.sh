#!/bin/bash

# Add the Docker repo and install docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update
apt-get install -y docker-ce
systemctl status docker

# Install docker-compose
curl -o /usr/local/bin/docker-compose -L "https://github.com/docker/compose/releases/download/1.15.0/docker-compose-$(uname -s)-$(uname -m)"
chmod +x /usr/local/bin/docker-compose
docker-compose -v

# Install docker-machine
curl -L "https://github.com/docker/machine/releases/download/v0.9.0/docker-machine-$(uname -s)-$(uname -m)" -o /
/usr/local/bin/docker-machine
chmod +x /usr/local/bin/docker-machine

# Build and run the container
cd /App
tar -xvf ./App.tar
rm App.tar
docker image build . -t cluster
docker container run -d -p 8080:80 cluster

