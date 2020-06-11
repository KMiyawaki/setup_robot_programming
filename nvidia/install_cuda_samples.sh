#!/bin/bash
/usr/local/cuda/bin/cuda-install-samples-11.0.sh ~/cuda-11.0_samples
cd ~/cuda-11.0_samples
# https://github.com/NVIDIA/cuda-samples/issues/22
make -k
