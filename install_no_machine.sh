#!/bin/bash
sudo apt update
wget https://web9001.nomachine.com/download/9.8/Linux/nomachine_9.8.2_1_amd64.deb
sudo dpkg -i nomachine_9.8.2_1_amd64.deb
sudo apt install -f -y
rm -f nomachine_9.8.2_1_amd64.deb
sudo systemctl start nxserver
sudo systemctl enable nxserver
sudo systemctl status nxserver
