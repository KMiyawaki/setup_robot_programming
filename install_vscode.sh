#!/bin/bash

function main(){
    wget -O code.deb https://go.microsoft.com/fwlink/?LinkID=760868
    dpkg -i code.deb
    rm -f code.deb
}

main "$@"
