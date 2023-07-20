#!/bin/bash

function main(){
    cd "$(dirname "$0")"
    local -r TARGET_ROS=`../get_suitable_ros1.sh`
    local -r ROS_SETUP="/opt/ros/${TARGET_ROS}/setup.bash"
    local -r WS="${HOME}/catkin_ws"
    local -r WS_SRC="${WS}/src"
    local -r WS_SETUP="${WS}/devel/setup.bash"
    echo "**Making workspace. Target ros-${TARGET_ROS}**"
    ../add_line.sh "source ${ROS_SETUP}" "${HOME}/.bashrc"
    ../add_line.sh "source ${WS_SETUP}" "${HOME}/.bashrc"

    source "${ROS_SETUP}"
    mkdir -p "${WS_SRC}"
    cd "${WS_SRC}"
    catkin_init_workspace
    cd "${WS}"
    catkin_make
}

main "$@"
