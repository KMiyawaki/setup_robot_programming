#!/bin/bash

function main(){
    local -r TARGET_ROS=`./get_suitable_ros.sh`
    local -r PACKAGES="roswww web-video-server tf2-web-republisher"
    echo "Start install ros-${TARGET_ROS} web packages"
    for p in ${PACKAGES}; do
        sudo apt-get install -y --no-install-recommends ros-${TARGET_ROS}-${p}
    done
    sudo /usr/bin/python2 -m pip install tornado
    sudo /usr/bin/python2 -m pip install pymongo
    cd ${HOME}/catkin_ws/src
    git clone https://github.com/GT-RAIL/robot_pose_publisher.git
    cd ..
    catkin_make
}

main "$@"
