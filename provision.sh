#!/usr/bin/env bash

# Install docker dependencies
apt-get update && apt-get install apt-transport-https ca-certificates

# add gpg key
apt-key adv \
  --keyserver hkp://p80.pool.sks-keyservers.net:80 \
  --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

# set up sources
echo "deb https://apt.dockerproject.org/repo ubuntu-wily main" \
  > /etc/apt/sources.list.d/docker.list

# update and purge old packages
apt-get update && apt-get purge lxc-docker

#install docker
apt-cache policy docker-engine
apt-get install -y linux-image-extra-$(uname -r) docker-engine

# start docker as service
service docker start

# add Vagrant user to docker group
usermod -aG docker vagrant