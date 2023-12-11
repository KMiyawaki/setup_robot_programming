#!/bin/bash

function main(){
    cd "$(dirname "$0")"
    if ../find_installed_ros.sh; then
        echo "Skip ROS2 installation"
        return 0
    fi
    local -r TARGET_ROS=`./get_suitable_ros2.sh`
    local INSTALL_TYPE="ros-base"
    if [ $# -ne 0 ]; then
        INSTALL_TYPE="${1}"
    fi
    readonly INSTALL_TYPE
    echo "Start install ros-${TARGET_ROS}"
    sudo apt-get update
    ./install_ros2_repos.sh
    sudo apt-get upgrade -y
    sudo apt-get install -y --no-install-recommends ros-${TARGET_ROS}-${INSTALL_TYPE}
    sudo apt-get install -y --no-install-recommends ros-dev-tools python3-colcon-common-extensions
    sudo rosdep init
    rosdep update
    # Suppress SetuptoolsDeprecationWarning
    sudo pip install setuptools==58.2.0
}

main "$@"
