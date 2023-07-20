#!/bin/bash

function main(){
    cd "$(dirname "$0")"
    local -r WS="${HOME}/ros2_ws"
    apt-get install -y --no-install-recommends libfltk1.3-dev
    git clone https://github.com/rtv/Stage.git ~/Stage
    cd ~/Stage
    mkdir build
    cd build/
    cmake ..
    make install
    cd ${WS}/src/
    git clone https://github.com/n0nzzz/stage_ros2.git
    cd ${WS}
    # Error
    colcon build --symlink-install
}

main "$@"
