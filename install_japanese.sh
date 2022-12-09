#!/bin/bash

function main(){
    local INSTALL_TYPE="WSL"
    if [ $# != 0 ]; then
        INSTALL_TYPE="${1}"
    fi
    readonly INSTALL_TYPE
    sudo apt-get install -y --no-install-recommends language-pack-ja-base
    sudo apt-get install -y --no-install-recommends language-pack-ja
    sudo apt-get install -y --no-install-recommends manpages-ja manpages-ja-dev
    sudo update-locale LANG=ja_JP.UTF-8
    
    if [ ${INSTALL_TYPE} != "WSL" ]; then
        sudo apt-get install -y --no-install-recommends fonts-takao
        sudo apt-get install -y --no-install-recommends ibus-mozc
    fi
}

main "$@"
