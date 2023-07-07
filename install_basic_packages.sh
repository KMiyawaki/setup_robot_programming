#!/bin/bash

function main(){
    local -r TARGET_ROS=`./get_suitable_ros.sh`
    local PACKAGES="curl gimp dbus-x11 emacs imagemagick net-tools openssh-server \
    unzip \
    x11-apps x11-utils x11-xserver-utils \
    zip"
    if [[ $TARGET_ROS = "noetic" ]]; then
        PACKAGES="${PACKAGES} python3-setuptools python3-pip python3-tk python-is-python3"
    else
        PACKAGES="${PACKAGES} python-setuptools python-pip python-tk"
    fi
    readonly PACKAGES
    echo ${PACKAGES}

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
