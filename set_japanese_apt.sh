#!/bin/bash

function main(){
    local BACK_NAME=`date '+%Y%m%d_%H%M%S'`
    BACK_NAME="/etc/apt/sources.list.${BACK_NAME}"
    cp /etc/apt/sources.list "${BACK_NAME}"
    sed -i 's@us.archive.ubuntu.com@ftp.jaist.ac.jp/pub/Linux@g' /etc/apt/sources.list
}

main "$@"
