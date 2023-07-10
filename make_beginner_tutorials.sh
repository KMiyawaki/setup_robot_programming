#!/bin/bash

function main(){
    local -r TARGET_ROS=`./get_suitable_ros.sh`
    local -r ROS_SETUP="/opt/ros/${TARGET_ROS}/setup.bash"
    local -r WS_SETUP="${HOME}/catkin_ws/devel/setup.bash"
    source ${ROS_SETUP}
    source ${WS_SETUP}
    cd ${HOME}/catkin_ws/src
    catkin_create_pkg beginner_tutorials std_msgs rospy roscpp
    mkdir ${HOME}/catkin_ws/src/beginner_tutorials/scripts
    cd ${HOME}/catkin_ws/src/beginner_tutorials/scripts
    wget https://raw.github.com/ros/ros_tutorials/indigo-devel/rospy_tutorials/001_talker_listener/talker.py
    chmod u+x talker.py
    wget https://raw.github.com/ros/ros_tutorials/indigo-devel/rospy_tutorials/001_talker_listener/listener.py
    chmod u+x listener.py
    cd ${HOME}/catkin_ws
    catkin_make
}

main "$@"
