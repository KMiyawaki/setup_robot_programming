#!/bin/bash

function main(){
    local -r VERSION_ID=`./get_ubuntu_version.sh`
    if [[ $VERSION_ID =~ "16" ]] || [[ $VERSION_ID =~ "18" ]]; then
        curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
        sudo python3 get-pip.py --force-reinstall
        rm -f get-pip.py
        sudo pip install --upgrade pip
        sudo pip3 install --upgrade pip
        local -r PACKAGES="pycodestyle pylint autopep8 autoflake"
        
        for p in ${PACKAGES}; do
            sudo /usr/bin/python2 -m pip install ${p}
            sudo /usr/bin/python3 -m pip install ${p}
        done
    elif [[ $VERSION_ID =~ "20" ]] || [[ $VERSION_ID =~ "22" ]]; then
        sudo pip3 install --upgrade pip
        local -r PACKAGES="pycodestyle pylint autopep8 autoflake"
        
        for p in ${PACKAGES}; do
            sudo /usr/bin/python3 -m pip install ${p}
        done
    else
        echo "*** ${VERSION_ID} is not supported ***"
    fi
}

main "$@"
