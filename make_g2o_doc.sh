#!/bin/bash

function main(){
    sudo apt-get install -y fig2dev
    sudo apt-get install -y texlive-latex-recommended
    sudo apt-get install -y texlive-latex-extra --no-install-recommends
    sudo apt-get install -y texlive-science
    cd ~/g2o/doc
    make
}

main "$@"
