# docker-vm
For those of us Windows user who don't want to install the older version of docker toolbox and would rather work in a real Ubuntu VM locally for any Docker and Kubernetes (tess.io) development.

## Pre-requisites
1. Vagrant: https://www.vagrantup.com 
2. VirtualBox: https://www.virtualbox.org

## Usage
Once the pre-requisites are properly installed, just do:

	vagrant up

Then to log into the local VM:

	vagrant ssh

From that point on you have the full `docker-engine` and `tess` CLI available to use.