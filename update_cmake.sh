#!/bin/bash

function main(){
    cd
    sudo apt-get install software-properties-common
    cmake --version
    wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | gpg --dearmor - | sudo tee /etc/apt/trusted.gpg.d/kitware.gpg >/dev/null
    sudo apt-add-repository "deb https://apt.kitware.com/ubuntu/ $(lsb_release -cs) main"
    sudo apt install cmake
    cmake --version
}

main "$@"
