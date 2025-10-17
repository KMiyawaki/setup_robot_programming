#!/bin/bash

function main(){
    if [ -f /etc/apt/sources.list.d/ros-latest.list ]; then
        sudo rm /etc/apt/sources.list.d/ros-latest.list
    fi
    sudo apt-get install -y --no-install-recommends curl
    sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
    sudo curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
    if [ -f /etc/apt/sources.list.d/ros1-latest.list ]; then
        sudo rm /etc/apt/sources.list.d/ros1-latest.list
    fi    
}

main "$@"
