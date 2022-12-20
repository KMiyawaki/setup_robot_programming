#!/bin/bash

sudo apt-get -y clean
sudo apt-get -y autoremove
sudo rm -rf /var/cache/apt/archives/*
sudo rm -rf /var/lib/apt/lists/* 
