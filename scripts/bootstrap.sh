#!/bin/bash

sudo apt update && sudo apt upgrade -y

./scripts/docker-install.sh

./scripts/vagrant-vm-prep.sh

sudo apt-get autoremove -y

