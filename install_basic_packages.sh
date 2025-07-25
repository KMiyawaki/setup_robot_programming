#!/bin/bash

function main(){
    cd "$(dirname "$0")"
    local -r SCRIPT=$(basename $0)
    local -r MIN_ARG=1
    if [ $# -lt "${MIN_ARG}" ]; then
        echo "usage: ${SCRIPT} {-b|-p|-x}" 1>&2
        return 1
    fi
    local -r VERSION_ID=`./get_ubuntu_version.sh`
    local -r BASE_PACKAGES="curl dnsutils emacs imagemagick iputils-ping less net-tools openssh-server unzip wget x11-apps zip xterm"
    local -r X11_PACKAGES="dbus-x11 x11-utils x11-xserver-utils"
    
    if [ ${1} = "-b" ]; then
        sudo apt-get install -y --no-install-recommends ${BASE_PACKAGES}
    elif [ ${1} = "-p" ]; then
        local PY_PACKAGES="python3-setuptools python3-pip python-is-python3"
        if [[ "${VERSION_ID}" =~ "16" ]] || [[ "${VERSION_ID}" =~ "18" ]]; then
            sudo apt-get install -y --no-install-recommends python3-setuptools python3-pip python-setuptools python-pip
            sudo /usr/bin/python3 -m pip install --upgrade pip
            sudo /usr/bin/python2 -m pip install --upgrade pip
        elif [[ "${VERSION_ID}" =~ "20" ]] || [[ "${VERSION_ID}" =~ "22" ]]; then
            sudo apt-get install -y --no-install-recommends python3-setuptools python3-pip python-is-python3
            sudo /usr/bin/python3 -m pip install --upgrade pip
        else
            echo -e "[install]\nbreak-system-packages = true" | sudo tee /etc/pip.conf > /dev/null
            sudo apt-get install -y --no-install-recommends python3-setuptools python3-pip python-is-python3
            sudo /usr/bin/python3 -m pip install --upgrade pip
        fi
    elif [ ${1} = "-x" ]; then
        sudo apt-get install -y --no-install-recommends ${X11_PACKAGES}
    else
        echo "UnKnown option ${1}"
    fi
}

main "$@"
