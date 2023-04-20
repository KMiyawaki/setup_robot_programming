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
    sudo apt-get update
    sudo apt-get install -y --no-install-recommends ros-${TARGET_ROS}-${INSTALL_TYPE}
    
    local PACKAGES="build-essential python-rosdep python-rosinstall python-rosinstall-generator python-wstool python-catkin-tools"
    if [[ $TARGET_ROS = "noetic" ]]; then
        PACKAGES="build-essential python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool python3-catkin-tools"
    fi
    readonly PACKAGES
    for p in ${PACKAGES}; do
        sudo apt-get install -y --no-install-recommends ${p}
    done

    sudo rosdep init
    rosdep update
    
    if ! grep -q /opt/ros/${TARGET_ROS}/setup.bash ${HOME}/.bashrc; then
        echo "source /opt/ros/${TARGET_ROS}/setup.bash" >> ${HOME}/.bashrc
        source ${HOME}/.bashrc
    fi
}

main "$@"
