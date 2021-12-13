#!/bin/bash
echo "deb https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64 /" | sudo tee /etc/apt/sources.list.d/nvidia-ml.list
sudo apt-get update
apt-cache search libcudnn
echo "Select appropriate libcudnn and run the following command"
echo "sudo apt-get install -y libcudnn***-dev # input your cudnn version into '***'"
