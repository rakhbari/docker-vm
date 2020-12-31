#!/bin/bash

GO_VER="1.12.1"

TEMP_DIR=${mktmp}
cd ${TEMP_DIR}

wget https://dl.google.com/go/go${GO_VER}.linux-amd64.tar.gz
sudo tar -C /usr/local -xvzf go${GO_VER}.linux-amd64.tar.gz

