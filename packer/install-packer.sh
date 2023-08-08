#!/bin/bash

wget https://releases.hashicorp.com/packer/1.9.2/packer_1.9.2_linux_amd64.zip
unzip packer_1.9.2_linux_amd64.zip
chmod +x packer
mv packer /usr/local/bin