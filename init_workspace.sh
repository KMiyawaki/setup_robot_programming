#!/bin/bash

function main(){
    local -r TARGET_ROS=`./get_suitable_ros.sh`
    local -r ROS_SETUP="/opt/ros/${TARGET_ROS}/setup.bash"
    local -r WS="${HOME}/catkin_ws"
    local -r WS_SRC="${WS}/src"
    local -r WS_SETUP="${WS}/devel/setup.bash"
    echo "**Making workspace. Target ros-${TARGET_ROS}**"
    if [ ! -e ${HOME}/.bashrc ]; then
        touch ${HOME}/.bashrc
    fi
    ./add_line.sh "source ${ROS_SETUP}" "${HOME}/.bashrc"
    ./add_line.sh "source ${WS_SETUP}" "${HOME}/.bashrc"

    source "${ROS_SETUP}"
    mkdir -p "${WS_SRC}"
    cd "${WS_SRC}"
    catkin_init_workspace
    cd "${WS}"
    catkin_make
}

main "$@"
