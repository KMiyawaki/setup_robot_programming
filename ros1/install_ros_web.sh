#!/bin/bash

function main(){
    cd "$(dirname "$0")"
    local -r TARGET_ROS=`./get_suitable_ros.sh`
    local -r PACKAGES="roswww web-video-server tf2-web-republisher"
    local -r WS="${HOME}/catkin_ws"
    local -r WS_SRC="${WS}/src"
    echo "Start install ros-${TARGET_ROS} web packages"
    for p in ${PACKAGES}; do
        apt-get install -y --no-install-recommends ros-${TARGET_ROS}-${p}
    done
    /usr/bin/python2 -m pip install tornado pymongo
    cd ${WS_SRC}
    git clone https://github.com/GT-RAIL/robot_pose_publisher.git
    cd ${WS}
    catkin_make
}

main "$@"
