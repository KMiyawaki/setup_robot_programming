#!/bin/bash
sudo sed -i 's@archive.ubuntu.com@ftp.jaist.ac.jp/pub/Linux@g' /etc/apt/sources.list
sudo apt update
sudo apt install curl -y
sudo apt install emacs -y
sudo apt install exfat-fuse exfat-utils -y
sudo apt install net-tools -y
sudo apt install openssh-server -y
sudo apt install python-pip -y
sudo apt install python3-pip -y 
sudo apt install zip unzip -y
sudo apt install gparted -y 
sudo apt install x11-apps x11-utils x11-xserver-utils dbus-x11 -y
