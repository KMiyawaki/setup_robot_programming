#!/bin/bash

function main(){
    cd "$(dirname "$0")"
    local -r TARGET_ROS=`./get_suitable_ros2.sh`
    local INSTALL_TYPE="ros-base"
    if [ $# -ne 0 ]; then
        INSTALL_TYPE="${1}"
    fi
    readonly INSTALL_TYPE
    echo "Start install ros-${TARGET_ROS}"
    apt-get update
    ./install_ros2_repos.sh
    apt-get upgrade -y
    apt-get install -y --no-install-recommends ros-${TARGET_ROS}-${INSTALL_TYPE}
    apt-get install -y --no-install-recommends ros-dev-tools python3-colcon-common-extensions
    rosdep init
    rosdep update
    # Suppress SetuptoolsDeprecationWarning
    pip install setuptools==58.2.0
}

main "$@"
