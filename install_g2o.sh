#!/bin/bash

function main(){
    cd
    sudo apt-get install -y \
        libeigen3-dev libspdlog-dev libsuitesparse-dev \
        qtdeclarative5-dev qt5-qmake libqglviewer-dev-qt5
    git clone https://github.com/RainerKuemmerle/g2o.git
    cd g2o
    git checkout refs/tags/20230806_git
    mkdir build
    cd build
    cmake ..
    make -j$(nproc)
    sudo make install
}

main "$@"
