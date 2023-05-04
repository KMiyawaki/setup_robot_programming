#!/bin/bash

function main(){
    ./update_gpg.sh
    sudo apt-get -y install cuda
}

main "$@"
