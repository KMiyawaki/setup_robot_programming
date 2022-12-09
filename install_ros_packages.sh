#!/bin/bash

function main(){
    local -r TARGET_ROS=`./get_ros_distoro.sh`
    # ROS packages
    local -r PACKAGES="cv-camera control-msgs \
    image-publisher image-transport image-transport-plugins \
    joint-state-publisher-gui joy \
    key-teleop \
    laser-filters laser-pipeline \
    map-server mouse-teleop \
    navigation \
    robot-state-publisher rosbash rosbridge-suite \
    rqt rqt-common-plugins rviz \
    slam-gmapping smach smach-viewer stage-ros \
    teleop-twist-joy teleop-twist-keyboard xacro"
    
    echo "Start install ros-${TARGET_ROS} packages"
    for p in ${PACKAGES}; do
        sudo apt-get install -y --no-install-recommends ros-${TARGET_ROS}-${p}
    done
}

main "$@"
