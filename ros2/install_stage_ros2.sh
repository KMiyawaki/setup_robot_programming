#!/bin/bash

function main(){
    cd "$(dirname "$0")"
    local -r TARGET_ROS=`./get_suitable_ros2.sh`
    if [[ "${TARGET_ROS}" =~ "humble" ]]; then
        local -r WS="${HOME}/ros2_ws"
        sudo apt-get install -y --no-install-recommends git cmake g++ libjpeg8-dev libpng-dev libglu1-mesa-dev libltdl-dev libfltk1.1-dev
        cd ${WS}/src
        git clone --branch ros2 https://github.com/tuw-robotics/Stage.git
        git clone --branch humble https://github.com/tuw-robotics/stage_ros2.git
        cd ${WS}
        colcon build --symlink-install --cmake-args -DOpenGL_GL_PREFERENCE=LEGACY
        colcon build --symlink-install --packages-select stage_ros2
    else
        echo "*** Stage for ${TARGET_ROS} is not supported ***"
    fi
}

main "$@"
