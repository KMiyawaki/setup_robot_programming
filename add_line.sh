#!/bin/bash

function main(){
    local -r LINE="${1}"
    local -r TARGET="${2}"
    
    if ! grep -q "${LINE}" "${TARGET}"; then
        echo "${LINE}" >> "${TARGET}"
    fi
}

main "$@"
