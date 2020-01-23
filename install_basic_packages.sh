#!/bin/bash
sudo apt update
sudo apt install curl -y
sudo apt install emacs -y
sudo apt install exfat-fuse exfat-utils -y
sudo apt install net-tools -y
sudo apt install openssh-server -y
sudo apt install python-pip -y
sudo apt install python3-pip -y 
sudo apt install gparted -y 
#vscode
wget -O code.deb https://go.microsoft.com/fwlink/?LinkID=760868
sudo dpkg -i code.deb
rm -f code.deb
