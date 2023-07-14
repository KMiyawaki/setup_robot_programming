#!/bin/bash

function main(){
    cd "$(dirname "$0")"
    local -r SCRIPT=$(basename $0)
    local -r MIN_ARG=3
    if [ $# -lt "${MIN_ARG}" ]; then
        echo "usage: ${SCRIPT} publisher extensionname version" 1>&2
        return 1
    fi
    
    local -r URL=`./build_vscode_extension_url.sh "$@"`
    local -r FILE="${1,,}.${2,,}-${3}.zip"
    wget "${URL}" -O "${FILE}"
    if [ $? = 0 ]; then
        echo ${FILE}
    else
        return 1
    fi
    return 0
}

main "$@"
