#!/bin/bash
# Before install, uninstall old drivers and cuda
# $ sudo apt-get --purge remove nvidia-*
# $ sudo apt-get --purge remove cuda-*
# Check your latest driver
# $ ubuntu-drivers devices
if [ $# -ne 1 ]; then
  echo "usage: install_nvidia_drivers.sh [driver name]" 1>&2
  echo "ex: install_nvidia_drivers.sh nvidia-driver-470" 1>&2
  echo "check recommended by 'check_driver.sh'" 1>&2
  exit 1
fi

sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt update
sudo apt install -y ${1}
sudo reboot
