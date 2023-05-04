#!/bin/bash

function main(){
    local -r VERSION_ID=`./get_ubuntu_version.sh`
    if [[ $VERSION_ID =~ "20" ]]; then
        echo "noetic"
    elif [[ $VERSION_ID =~ "18" ]]; then
        echo "melodic"
    elif [[ $VERSION_ID =~ "16" ]]; then
        echo "kinetic"
    else
        echo "*** No supported ROS found ***"
    fi
}

main "$@"
