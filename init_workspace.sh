#!/bin/bash

function main(){
    local -r TARGET_ROS=`./get_ros_distoro.sh`
    echo "**Making workspace. Target ros-${TARGET_ROS}**"
    local -r ROS_SETUP="/opt/ros/${TARGET_ROS}/setup.bash"
    if ! grep -q ${ROS_SETUP} ~/.bashrc; then
        echo "source ${ROS_SETUP}" >> ~/.bashrc
    fi
    source ${ROS_SETUP}
    mkdir -p ~/catkin_ws/src
    cd ~/catkin_ws/src/
    catkin_init_workspace
    cd ..
    catkin_make
    cd
    local -r WS_SETUP="~/catkin_ws/devel/setup.bash"
    if ! grep -q ${WS_SETUP} ~/.bashrc; then
        echo "source ${WS_SETUP}" >> ~/.bashrc
    fi
}

main "$@"
