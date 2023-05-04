#!/bin/bash

function main(){
    local -r TARGET_ROS=`./get_suitable_ros.sh`
    if [ ! -d ${HOME}/.emacs.d ]; then
        mkdir ${HOME}/.emacs.d
    fi
    if [ ! -e ${HOME}/.emacs.d/init.el ]; then
        touch ${HOME}/.emacs.d/init.el
    fi
    sudo apt-get install -y --no-install-recommends ros-${TARGET_ROS}-rosemacs
    if ! grep -q "(add-to-list 'load-path \"/opt/ros/${TARGET_ROS}/share/emacs/site-lisp\")" ${HOME}/.emacs.d/init.el; then
        echo "(add-to-list 'load-path \"/opt/ros/${TARGET_ROS}/share/emacs/site-lisp\")" >> ${HOME}/.emacs.d/init.el
    fi
    if ! grep -q "(require 'rosemacs-config)" ${HOME}/.emacs.d/init.el; then
        echo "(require 'rosemacs-config)" >> ${HOME}/.emacs.d/init.el
    fi
}

main "$@"
