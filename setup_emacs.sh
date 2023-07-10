#!/bin/bash

function main(){
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
