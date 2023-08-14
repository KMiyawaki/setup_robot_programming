#!/bin/bash

function main(){
    cd "$(dirname "$0")"
    sudo apt-get update
    sudo apt-get install -y --no-install-recommends locales
    sudo locale-gen en_US en_US.UTF-8
    sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
    ../add_line.sh "export LANG=en_US.UTF-8" "${HOME}/.bashrc"
}

main "$@"
