#!/bin/bash

function main(){
    cd
    git clone https://github.com/isl-org/Open3D
    cd Open3D
    git checkout refs/tags/v0.18.0
    util/install_deps_ubuntu.sh
    mkdir build
    cd build
    cmake ..
    make -j$(nproc)
    sudo make install
    sudo make install-pip-package
}

main "$@"
