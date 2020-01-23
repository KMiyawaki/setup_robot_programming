#!/bin/bash
/usr/local/cuda-10.2/bin/cuda-install-samples-10.2.sh ~/cuda-10.2_samples
cd ~/cuda-10.2_samples
# https://github.com/NVIDIA/cuda-samples/issues/22
make -k
