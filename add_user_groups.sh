#!/bin/bash

function main(){
    local TARGET_USER=${USER}
    if [ $# -ne 0 ]; then
        TARGET_USER=${1}
    fi
    readonly TARGET_USER
    local -r TARGET_GROUPS="adm dialout cdrom sudo dip video plugdev lpadmin sambashare"
    for g in ${TARGET_GROUPS}; do
        sudo gpasswd -a ${TARGET_USER} ${g}
    done
}

main "$@"
