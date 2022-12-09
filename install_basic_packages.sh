#!/bin/bash

function main(){
    sudo apt-get update
    local -r PACKAGES="curl	dbus-x11 emacs net-tools openssh-server \
    python-setuptools python3-setuptools python-pip python-tk \
    unzip \
    x11-apps x11-utils x11-xserver-utils \
    zip"
    
    for p in ${PACKAGES}; do
        sudo apt-get install -y --no-install-recommends ${p}
    done
    # emacs
    if [ ! -d ~/.emacs.d ]; then
        mkdir ~/.emacs.d
    fi
    if [ ! -e ~/.emacs.d/init.el ]; then
        touch ~/.emacs.d/init.el
    fi
    if ! grep -q "(setq inhibit-startup-message t)" ~/.emacs.d/init.el; then
        echo "(setq inhibit-startup-message t)" >> ~/.emacs.d/init.el
    fi
}

main "$@"
