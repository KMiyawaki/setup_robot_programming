#!/bin/bash

function main(){
    local -r TARGET_ROS=`./get_ros_distoro.sh`
    local -r ROS_SETUP="/opt/ros/${TARGET_ROS}/setup.bash"
    local -r WS_SETUP="~/catkin_ws/devel/setup.bash"
    source ${ROS_SETUP}
    source ${WS_SETUP}
    cd ~/catkin_ws/src
    catkin_create_pkg beginner_tutorials std_msgs rospy roscpp
    mkdir ~/catkin_ws/src/beginner_tutorials/scripts
    cd ~/catkin_ws
    catkin_make
}

main "$@"
