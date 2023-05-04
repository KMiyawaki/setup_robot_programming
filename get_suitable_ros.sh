#!/bin/bash

function main(){
    local -r UBUNTU=`./get_ubuntu_version.sh`
    if [[ "$UBUNTU" == 20* ]]; then
        echo "noetic"
    elif [[ "$UBUNTU" == 18* ]]; then
        echo "melodic"
    elif [[ "$UBUNTU" == 16* ]]; then
        echo "kinetic"
    else
        echo "*** No supported ROS found ***"
    fi
}

main "$@"
