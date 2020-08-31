#!/bin/bash
sudo killall -KILL apt.systemd.daily
sudo mv /etc/apt/apt.conf.d/50appstream /etc/apt/apt.conf.d/50appstream.disable
sudo apt update -y
sudo apt upgrade -y
sudo mv /etc/apt/apt.conf.d/50appstream.disable /etc/apt/apt.conf.d/50appstream
sudo apt update -y

