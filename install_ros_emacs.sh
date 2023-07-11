#!/bin/bash

function main(){
    local -r TARGET_ROS=`./get_suitable_ros.sh`
    local -r EMACS_D="${HOME}/.emacs.d"
    local -r INIT_EL="${EMACS_D}/init.el"
    if [ ! -d "${EMACS_D}" ]; then
        mkdir "${EMACS_D}"
    fi
    if [ ! -e "${INIT_EL}" ]; then
        touch "${INIT_EL}"
    fi
    sudo apt-get install -y --no-install-recommends "ros-${TARGET_ROS}-rosemacs"
    ./add_line.sh "(add-to-list 'load-path \"/opt/ros/${TARGET_ROS}/share/emacs/site-lisp\")" "${INIT_EL}"
    ./add_line.sh "(require 'rosemacs-config)" "${INIT_EL}"
}

main "$@"
