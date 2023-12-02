#!/bin/bash

function main(){
    cd "$(dirname "$0")"
    local -r VERSION_ID=`./get_ubuntu_version.sh`
    local -r CPU=`uname -i`
    local PY2_PACKAGES="pycodestyle autopep8==1.6 autoflake" # can not install pylint on ARM
    local PY3_PACKAGES="pycodestyle autopep8 autoflake"
    if [[ "${CPU}" != *arm* ]]; then
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
