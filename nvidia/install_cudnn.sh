#!/bin/bash
echo "deb https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64 /" | sudo tee /etc/apt/sources.list.d/nvidia-ml.list
sudo apt-get update
sudo apt-get install libcudnn8-dev
