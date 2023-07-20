#!/bin/bash

function main(){
    cd "$(dirname "$0")"
    local INSTALL_TYPE="WSL"
    if [ $# != 0 ]; then
        INSTALL_TYPE="${1}"
    fi
    readonly INSTALL_TYPE
    local -r PACKAGES="language-pack-ja-base language-pack-ja manpages-ja manpages-ja-dev"
    apt-get install -y --no-install-recommends ${PACKAGES}
    update-locale LANG=ja_JP.UTF-8
    
    if [ ${INSTALL_TYPE} != "WSL" ]; then
        apt-get install -y --no-install-recommends fonts-takao ibus-mozc
    fi
}

main "$@"
