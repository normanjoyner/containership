#!/bin/bash

##############################
# starts containership process
##############################

echo -e "\033[0;32mConnected to $(hostname)\033[0;m"

# rebuilds containership node_modules
cd /mnt/containership/containership
echo -e "\033[0;33mRebuilding containership node_modules\033[0;m"
sudo npm rebuild

# starts containership process
sudo node application.js agent --mode $(hostname | sed "s/[0-9]*//g") --legiond-interface=eth1 --legiond-scope=private --log-level=debug --cidr=10.10.10.0/24
