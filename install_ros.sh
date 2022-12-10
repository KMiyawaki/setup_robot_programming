#!/bin/bash

function main(){
    local -r TARGET_ROS=`./get_ros_distoro.sh`
    local INSTALL_TYPE="ros-base"
    if [ $# -ne 0 ]; then
        INSTALL_TYPE="${1}"
    fi
    readonly INSTALL_TYPE
    echo "Start install ros-${TARGET_ROS}"
    ./install_ros_key.sh
    sudo apt-get install -y --no-install-recommends ros-${TARGET_ROS}-${INSTALL_TYPE}
    
    local -r PACKAGES="build-essential python-rosdep python-rosinstall python-rosinstall-generator python-wstool python-catkin-tools"
    for p in ${PACKAGES}; do
        sudo apt-get install -y --no-install-recommends ${p}
    done

    sudo rosdep init
    rosdep update
    
    if ! grep -q /opt/ros/${TARGET_ROS}/setup.bash ~/.bashrc; then
        echo "source /opt/ros/${TARGET_ROS}/setup.bash" >> ~/.bashrc
        source ~/.bashrc
    fi
}

main "$@"
