#!/bin/bash

function main(){
    cd "$(dirname "$0")"
    local -r TARGET_ROS=`./get_suitable_ros.sh`
    local -r ROS_SETUP="/opt/ros/${TARGET_ROS}/setup.bash"
    local -r WS="${HOME}/catkin_ws"
    local -r WS_SRC="${WS}/src"
    local -r WS_SETUP="${WS}/devel/setup.bash"
    source "${ROS_SETUP}"
    source "${WS_SETUP}"
    cd "${WS_SRC}"
    catkin_create_pkg beginner_tutorials std_msgs rospy roscpp
    mkdir -p "${WS_SRC}/beginner_tutorials/scripts"
    cd "${WS_SRC}/beginner_tutorials/scripts"
    wget https://raw.github.com/ros/ros_tutorials/indigo-devel/rospy_tutorials/001_talker_listener/talker.py
    chmod u+x talker.py
    wget https://raw.github.com/ros/ros_tutorials/indigo-devel/rospy_tutorials/001_talker_listener/listener.py
    chmod u+x listener.py
    cd ${WS}
    catkin_make
}

main "$@"
