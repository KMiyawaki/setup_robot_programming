#!/bin/bash

function main(){
    local -r VERSION=`../get_ubuntu_version.sh`
    wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu${VERSION}/x86_64/cuda-keyring_1.0-1_all.deb
    sudo dpkg -i cuda-keyring_1.0-1_all.deb
    sudo apt update
    rm cuda-keyring_1.0-1_all.deb
}

main "$@"
