#!/bin/bash

function main(){
    local -r SCRIPT=$(basename $0)
    local -r MIN_ARG=1
    if [ $# -lt "${MIN_ARG}" ]; then
        echo "usage: ${SCRIPT} {-b|-p|-x}" 1>&2
        return 1
    fi
    local -r VERSION_ID=`./get_ubuntu_version.sh`
    local -r BASE_PACKAGES="curl emacs less net-tools openssh-server unzip x11-apps zip wget"
    local -r X11_PACKAGES="dbus-x11 x11-utils x11-xserver-utils"
    local PY_PACKAGES="python3-setuptools python3-pip python-is-python3"
    if [[ "${VERSION_ID}" =~ "16" ]] || [[ "${VERSION_ID}" =~ "18" ]]; then
        PY_PACKAGES="python3-setuptools python3-pip python-setuptools python-pip"
    fi
    readonly PY_PACKAGES
    
    if [ ${1} = "-b" ]; then
        sudo apt-get install -y --no-install-recommends ${BASE_PACKAGES}
    elif [ ${1} = "-p" ]; then
        sudo apt-get install -y --no-install-recommends ${PY_PACKAGES}
    elif [ ${1} = "-x" ]; then
        sudo apt-get install -y --no-install-recommends ${X11_PACKAGES}
    else
        echo "UnKnown option ${1}"
    fi
}

main "$@"
