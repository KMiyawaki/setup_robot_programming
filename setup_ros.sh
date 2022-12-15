#!/bin/bash

function main(){
    local MYCOUNTRY="JP"
    if [ $# != 0 ]; then
        MYCOUNTRY="${1}"
    fi
    readonly MYCOUNTRY
    if [ ${MYCOUNTRY} = "JP" ]; then
        echo "Japanese apt mirror will be used."
        ./set_japanese_apt.sh
    fi
    # sudo apt-get update is included in install_ros.sh
    ./install_ros.sh desktop-full
    ./install_basic_packages.sh
    ./install_chrome.sh
    ./install_vscode.sh
    ./install_python_packages.sh
    ./install_ros_packages.sh
    ./install_vscode_extensions.sh
    sudo apt-get upgrade -y
    sudo apt-get autoremove -y
    ./init_workspace.sh
    ./make_beginner_tutorials.sh
    if [ ${MYCOUNTRY} = "JP" ]; then
        echo "Japanese apt mirror will be used."
        ./install_japanese.sh
    fi
}

main "$@"
