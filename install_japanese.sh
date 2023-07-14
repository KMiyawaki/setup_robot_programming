#!/bin/bash

function main(){
    cd "$(dirname "$0")"
    local INSTALL_TYPE="WSL"
    if [ $# != 0 ]; then
        INSTALL_TYPE="${1}"
    fi
    readonly INSTALL_TYPE
    local -r PACKAGES="language-pack-ja-base language-pack-ja manpages-ja manpages-ja-dev"
    sudo apt-get install -y --no-install-recommends ${PACKAGES}
    sudo update-locale LANG=ja_JP.UTF-8
    
    if [ ${INSTALL_TYPE} != "WSL" ]; then
        sudo apt-get install -y --no-install-recommends fonts-takao ibus-mozc
    fi
}

main "$@"
