#!/bin/bash

function main(){
    sudo ubuntu-drivers devices
    echo "*******************************************************"
    echo "*** Choose nvidia driver and install. remove 'open' ***"
}

main "$@"
