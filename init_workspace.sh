#!/bin/bash

function main(){
    local -r TARGET_ROS=`./get_ros_distoro.sh`
    echo "**Making workspace. Target ros-${TARGET_ROS}**"
    local -r ROS_SETUP="/opt/ros/${TARGET_ROS}/setup.bash"
    if ! grep -q ${ROS_SETUP} ${HOME}/.bashrc; then
        echo "source ${ROS_SETUP}" >> ${HOME}/.bashrc
    fi
    source ${ROS_SETUP}
    mkdir -p ${HOME}/catkin_ws/src
    cd ${HOME}/catkin_ws/src/
    catkin_init_workspace
    cd ..
    catkin_make
    cd
    local -r WS_SETUP="${HOME}/catkin_ws/devel/setup.bash"
    if ! grep -q ${WS_SETUP} ${HOME}/.bashrc; then
        echo "source ${WS_SETUP}" >> ${HOME}/.bashrc
    fi
}

main "$@"
