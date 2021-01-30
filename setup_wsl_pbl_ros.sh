#!/bin/bash
MYCOUNTRY="JP"
if [ $# != 0 ]; then
    MYCOUNTRY="${1}"
fi
if [ ${MYCOUNTRY} = "JP" ]; then
    echo "Japanese apt mirror will be used."
    ./set_japanese_apt.sh
fi
./install_ros.sh
./install_basic_packages.sh
./install_python_packages.sh
./install_ros_packages.sh
./install_vscode_extensions_from_file.sh
if [ ${MYCOUNTRY} = "JP" ]; then
    ./install_japanese.sh
fi
./upgrade_packages.sh
./init_workspace.sh
