#!/bin/bash

function main(){
    cd ~/catkin_ws/src
    catkin_create_pkg beginner_tutorials std_msgs rospy roscpp
    mkdir ~/catkin_ws/src/beginner_tutorials/scripts
    cd ~/catkin_ws
    catkin_make
}

main "$@"
