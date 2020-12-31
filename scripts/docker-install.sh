#!/bin/bash

#
# This script assumes an Ubuntu Linux distro.
# No other distros are supported at this time.
#

echo '==========================================='
echo '=== Installing docker & docker-compose  ...'
echo '==========================================='
if [ ! -f /etc/os-release ]; then
  echo "!!! ERROR: Unable to locate file: /etc/os-relase"
  echo "!!! Only Ubuntu distros are supported at this time."
  echo "!!! Exiting ..."
  echo ""
  exit 1
fi

source /etc/os-release
DOCKER_COMPOSE_VERSION='1.24.1'

sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu ${UBUNTU_CODENAME} stable"
sudo apt-get update
sudo apt-get install -y docker-ce
sudo wget -O /usr/local/bin/docker-compose \
  https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)
sudo chmod +x /usr/local/bin/docker-compose
sudo gpasswd -a vagrant docker

