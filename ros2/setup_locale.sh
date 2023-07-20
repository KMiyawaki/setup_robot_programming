#!/bin/bash

function main(){
    cd "$(dirname "$0")"
    apt-get update
    apt-get install -y --no-install-recommends locales
    locale-gen en_US en_US.UTF-8
    update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
    ../add_line.sh "export LANG=en_US.UTF-8" "${HOME}/.bashrc"
}

main "$@"
