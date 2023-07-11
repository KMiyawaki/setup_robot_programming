#!/bin/bash

function main(){
    local -r VERSION_ID=`./get_ubuntu_version.sh`
    local -r PY2_PACKAGES="pycodestyle pylint autopep8==1.6 autoflake"
    local -r PY3_PACKAGES="pycodestyle pylint autopep8 autoflake"
    sudo /usr/bin/python3 -m pip install --upgrade pip
    sudo /usr/bin/python3 -m pip install ${PY3_PACKAGES}
    if [[ "${VERSION_ID}" =~ "16" ]] || [[ "${VERSION_ID}" =~ "18" ]]; then
        sudo /usr/bin/python2 -m pip install --upgrade pip
        sudo /usr/bin/python2 -m pip install ${PY2_PACKAGES}
    fi
}

main "$@"
