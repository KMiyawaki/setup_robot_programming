#!/bin/bash
wget https://bootstrap.pypa.io/2.7/get-pip.py -O get-pip.py
sudo /usr/bin/python2 get-pip.py
sudo /usr/bin/python2 -m pip install pip -U
rm -f get-pip.py
