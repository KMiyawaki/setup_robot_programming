#!/bin/bash
sudo update-pciids
sudo apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub
wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-repo-ubuntu1804_10.1.168-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu1804_10.1.168-1_amd64.deb
sudo apt-get update
sudo apt-get install cuda cuda-drivers
rm cuda-repo-ubuntu1804_10.1.168-1_amd64.deb
sudo reboot
