#!/bin/bash

function main(){
    if [ ! -d ${HOME}/.emacs.d ]; then
        mkdir ${HOME}/.emacs.d
    fi
    if [ ! -e ${HOME}/.emacs.d/init.el ]; then
        touch ${HOME}/.emacs.d/init.el
    fi
    ./add_line.sh "(setq inhibit-startup-message t)" ${HOME}/.emacs.d/init.el
}

main "$@"
