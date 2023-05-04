#!/bin/bash

function main(){
    sudo apt remove --purge "nvidia-*" -y && sudo apt autoremove
    sudo apt remove --purge "cuda-*" -y && sudo apt autoremove
    sudo apt remove --purge "libcudnn*" -y && sudo apt autoremove
    sudo apt remove --purge "libnvidia-*" -y && sudo apt autoremove
}

main "$@"
