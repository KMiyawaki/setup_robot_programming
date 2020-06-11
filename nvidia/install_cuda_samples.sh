#!/bin/bash
/usr/local/cuda/bin/cuda-install-samples-11.0.sh ~
cd ~/NVIDIA_CUDA-11.0_Samples
# https://github.com/NVIDIA/cuda-samples/issues/22
make -k
