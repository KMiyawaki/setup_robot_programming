#/bin/bash

function main(){
    sudo pip install --upgrade pip
    sudo pip3 install --upgrade pip
    local -r PACKAGES="pycodestyle pylint autopep8 autoflake"
    
    for p in ${PACKAGES}; do
        sudo /usr/bin/python2 -m pip install ${p}
        sudo /usr/bin/python3 -m pip install ${p}
    done
}

main "$@"
