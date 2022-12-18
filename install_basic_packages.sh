#!/bin/bash

function main(){
    local -r PACKAGES="curl	dbus-x11 emacs net-tools openssh-server \
    python-setuptools python3-setuptools python-pip python-tk \
    unzip \
    x11-apps x11-utils x11-xserver-utils \
    zip"
    
    for p in ${PACKAGES}; do
        sudo apt-get install -y --no-install-recommends ${p}
    done
    # emacs
    if [ ! -d ${HOME}/.emacs.d ]; then
        mkdir ${HOME}/.emacs.d
    fi
    if [ ! -e ${HOME}/.emacs.d/init.el ]; then
        touch ${HOME}/.emacs.d/init.el
    fi
    if ! grep -q "(setq inhibit-startup-message t)" ${HOME}/.emacs.d/init.el; then
        echo "(setq inhibit-startup-message t)" >> ${HOME}/.emacs.d/init.el
    fi
}

main "$@"
