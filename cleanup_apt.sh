#!/bin/bash

function main(){
    apt-get -y clean
    apt-get -y autoremove
    rm -rf /var/cache/apt/archives/*
    rm -rf /var/lib/apt/lists/*
}

main "$@"
