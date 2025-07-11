#!/bin/bash

function main(){
    cd "$(dirname "$0")"
    local -r CRNT_DIR=`pwd`
    local -r TARGET_ROS=`./get_suitable_ros2.sh`
    local -r ROS_SETUP="/opt/ros/${TARGET_ROS}/setup.bash"
    local -r BASHRC="${HOME}/.bashrc"
    local -r WS="${HOME}/ros2_ws"
    echo "**Making workspace. Target ros-${TARGET_ROS}**"
    if [[ "${TARGET_ROS}" =~ "foxy" ]] || [[ "${TARGET_ROS}" =~ "humble" ]]; then
        # Suppress SetuptoolsDeprecationWarning
        sudo pip install setuptools==58.2.0
    fi
    rosdep update
    ../add_line.sh "source ${ROS_SETUP}" "${BASHRC}"
    ../add_line.sh "source ${WS}/install/setup.bash" "${BASHRC}"
    
    if [[ "${TARGET_ROS}" =~ "foxy" ]] || [[ "${TARGET_ROS}" =~ "humble" ]]; then
        ../add_line.sh "export ROS_LOCALHOST_ONLY=1" "${BASHRC}"
    else
        ../add_line.sh "ROS_AUTOMATIC_DISCOVERY_RANGE=LOCALHOST" "${BASHRC}"
    fi
    ../add_line.sh "export ROS_DOMAIN_ID=0" "${BASHRC}"
    ../add_line.sh "source /usr/share/colcon_cd/function/colcon_cd.sh" "${BASHRC}"
    ../add_line.sh "source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash" "${BASHRC}"
    ../add_line.sh "export _colcon_cd_root=/opt/ros/${TARGET_ROS}/" "${BASHRC}"
    
    source ${ROS_SETUP}
    mkdir -p "${WS}/src"
    # cd "${WS}/src"
    # git clone https://github.com/ros2/examples -b "${TARGET_ROS}"
    # git clone https://github.com/ros2/example_interfaces.git -b "${TARGET_ROS}"
    cd "${WS}"
    colcon build --symlink-install
    # colcon test

    if [ $# -ne 0 ]; then
        cd ${CRNT_DIR}
        ./make_py_pubsub.sh
    fi
}

main "$@"
