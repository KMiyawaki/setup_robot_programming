#!/bin/bash

function main(){
    cd "$(dirname "$0")"
    local -r TARGET_ROS=`./get_suitable_ros2.sh`
    # ROS packages
    local -r PACKAGES="control-msgs \
    demo-nodes-cpp demo-nodes-py \
    image-publisher image-transport image-transport-plugins \
    joint-state-publisher-gui joy \
    key-teleop \
    laser-filters \
    mouse-teleop \
    navigation2 \
    robot-state-publisher rosbridge-suite \
    rqt rqt-common-plugins rviz2 \
    slam-toolbox \
    teleop-twist-joy teleop-twist-keyboard turtlesim \
    xacro"
    
    echo "Start install ros-${TARGET_ROS} packages"
    for p in ${PACKAGES}; do
        sudo apt-get install -y --no-install-recommends ros-${TARGET_ROS}-${p}
    done
    sudo pip3 install transforms3d
}

main "$@"
