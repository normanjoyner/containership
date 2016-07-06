#!/bin/bash

#############################
# stops containership process
#############################

echo -e "\033[0;32mConnected to $(hostname)\033[0;m"

# kills containership process
echo -e "\033[0;33mKilling containership process\033[0;m"
sudo killall -15 node
