#!/bin/bash
echo 'export PATH="/usr/local/cuda/bin:$PATH"' >> ${HOME}/.bashrc
echo 'export LD_LIBRARY_PATH="/usr/local/cuda/lib64:$LD_LIBRARY_PATH"' >> ${HOME}/.bashrc
