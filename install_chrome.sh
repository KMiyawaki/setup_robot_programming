#!/bin/bash
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt-get install ./google-chrome-stable_current_amd64.deb -y
rm -f ./google-chrome-stable_current_amd64.deb
