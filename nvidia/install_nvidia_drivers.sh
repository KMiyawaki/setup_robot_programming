#!/bin/bash
# Before install, uninstall old drivers and cuda
# $ sudo apt-get --purge remove nvidia-*
# $ sudo apt-get --purge remove cuda-*
# Check your latest driver
# $ ubuntu-drivers devices
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt update
sudo apt install nvidia-driver-470
