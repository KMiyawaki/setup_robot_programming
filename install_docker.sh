#!/bin/bash

function main(){
    cd "$(dirname "$0")"
    local -r SCRIPT=$(basename "$0")
    local -r MIN_ARG=1
    if [ $# -lt "${MIN_ARG}" ]; then
        echo "usage: ${SCRIPT} {-a(all)|-c(docker-compose only)}" 1>&2
        return 1
    fi
    sudo apt-get update && sudo apt-get upgrade -y

    curl -fsSL https://get.docker.com -o get-docker.sh
    sudo sh get-docker.sh
    rm get-docker.sh
    sudo usermod -aG docker "${USER}"
}

main "$@"
