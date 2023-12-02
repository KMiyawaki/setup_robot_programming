#!/bin/bash

function main(){
    cd "$(dirname "$0")"
    local -r VERSION_ID=`./get_ubuntu_version.sh`
    local -r UNAME=`uname -m`
    local ARCH=""
    if [[ $UNAME =~ "x86_64" ]]; then
        ARCH="amd64"
    elif [[ $UNAME =~ "aarch64" ]]; then
        ARCH="arm64"
    else
        echo "${UNAME} is not supported ***"
        exit 1
    fi
    local PY2_PACKAGES="pycodestyle autopep8==1.6 autoflake" # can not install pylint on ARM
    local PY3_PACKAGES="pycodestyle autopep8 autoflake"
    if [[ "${ARCH}" != *arm* ]]; then
        PY2_PACKAGES="${PY2_PACKAGES} pylint"
        PY3_PACKAGES="${PY3_PACKAGES} pylint"
    fi
    readonly PY2_PACKAGES
    readonly PY3_PACKAGES
    sudo /usr/bin/python3 -m pip install ${PY3_PACKAGES}
    if [[ "${VERSION_ID}" =~ "16" ]] || [[ "${VERSION_ID}" =~ "18" ]]; then
        sudo /usr/bin/python2 -m pip install ${PY2_PACKAGES}
    fi
}

main "$@"
