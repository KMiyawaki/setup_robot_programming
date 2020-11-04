#!/bin/bash
/usr/local/cuda/bin/cuda-install-samples-*.sh ~
cd ~/NVIDIA_CUDA-*_Samples
# https://github.com/NVIDIA/cuda-samples/issues/22
make -k
