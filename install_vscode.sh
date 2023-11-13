#!/bin/bash

function main(){
    wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
    local -r UNAME=`uname -m`
    local ARCH=""
    if [[ $UNAME =~ "x86_64" ]]; then
        ARCH="amd64"
    elif [[ $UNAME =~ "aarch64" ]]; then
        ARCH="arm64"
    else
        echo "${UNAME} is not supported ***"
        exit 1
    fi
    echo "Install VSCode for ${ARCH}"
    sudo add-apt-repository "deb [arch=${ARCH}] https://packages.microsoft.com/repos/vscode stable main"
    sudo apt-get update
    sudo apt-get install -y code 
}

main "$@"
