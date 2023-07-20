#!/bin/bash

function main(){
    cd "$(dirname "$0")"
    local -r TARGET_ROS=`./get_suitable_ros.sh`
    local INSTALL_TYPE="ros-base"
    if [ $# -ne 0 ]; then
        INSTALL_TYPE="${1}"
    fi
    readonly INSTALL_TYPE
    echo "Start install ros-${TARGET_ROS}"
    ./install_ros_key.sh
    apt-get update
    apt-get install -y --no-install-recommends ros-${TARGET_ROS}-${INSTALL_TYPE}
    
    local PACKAGES="build-essential python-rosdep python-rosinstall python-rosinstall-generator python-wstool python-catkin-tools"
    if [[ $TARGET_ROS = "noetic" ]]; then
        PACKAGES="build-essential python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool python3-catkin-tools"
    fi
    readonly PACKAGES
    apt-get install -y --no-install-recommends ${PACKAGES}
    rosdep init
    rosdep update
    ../add_line.sh "source /opt/ros/${TARGET_ROS}/setup.bash" "${HOME}/.bashrc"
}

main "$@"
