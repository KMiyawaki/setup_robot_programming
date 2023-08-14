#!/bin/bash

function main(){
    sudo apt-get install -y --no-install-recommends software-properties-common
    sudo add-apt-repository -y universe
    sudo apt-get update
    sudo apt-get install -y --no-install-recommends curl gnupg lsb-release
    sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
    sudo echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(source /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null
    sudo apt-get update
}

main "$@"
