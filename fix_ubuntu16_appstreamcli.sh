#!/bin/bash
sudo killall -KILL apt.systemd.daily
sudo mv /etc/apt/apt.conf.d/50appstream /etc/apt/apt.conf.d/50appstream.disable
sudo apt-get update -y
sudo apt-get upgrade -y
sudo mv /etc/apt/apt.conf.d/50appstream.disable /etc/apt/apt.conf.d/50appstream
sudo apt-get update -y
