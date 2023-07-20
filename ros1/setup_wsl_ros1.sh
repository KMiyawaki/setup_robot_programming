#!/bin/bash

function main(){
    cd "$(dirname "$0")"
    local MYCOUNTRY="JP"
    if [ $# != 0 ]; then
        MYCOUNTRY="${1}"
    fi
    readonly MYCOUNTRY
    if [ ${MYCOUNTRY} = "JP" ]; then
        echo "Japanese apt mirror will be used."
        ../set_japanese_apt.sh
    fi
    # sudo apt-get update is included in install_ros1.sh
    ./install_ros1.sh
    ../install_basic_packages.sh
    ../install_python_packages.sh
    ./install_ros1_packages.sh
    ../install_vscode_extensions_from_file.sh
    ../upgrade_packages.sh
    ./init_workspace.sh
    ./make_beginner_tutorials.sh
    if [ ${MYCOUNTRY} = "JP" ]; then
        echo "Install Japanese languages."
        ../install_japanese.sh
    fi
}

main "$@"
