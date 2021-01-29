#!/bin/bash
TARGET_ROS=`./get_ros_distoro.sh`
# ROS packages
echo "Start install ros-${TARGET_ROS} packages"
sudo apt install -y --no-install-recommends ros-${TARGET_ROS}-cv-camera
sudo apt install -y --no-install-recommends ros-${TARGET_ROS}-image-transport
sudo apt install -y --no-install-recommends ros-${TARGET_ROS}-image-transport-plugins
sudo apt install -y --no-install-recommends ros-${TARGET_ROS}-joint-state-publisher-gui
sudo apt install -y --no-install-recommends ros-${TARGET_ROS}-joy
sudo apt install -y --no-install-recommends ros-${TARGET_ROS}-laser-filters
sudo apt install -y --no-install-recommends ros-${TARGET_ROS}-laser-pipeline
sudo apt install -y --no-install-recommends ros-${TARGET_ROS}-map-server
sudo apt install -y --no-install-recommends ros-${TARGET_ROS}-mouse-teleop
sudo apt install -y --no-install-recommends ros-${TARGET_ROS}-navigation
sudo apt install -y --no-install-recommends ros-${TARGET_ROS}-robot-state-publisher
sudo apt install -y --no-install-recommends ros-${TARGET_ROS}-rosbash
sudo apt install -y --no-install-recommends ros-${TARGET_ROS}-rviz
sudo apt install -y --no-install-recommends ros-${TARGET_ROS}-slam-gmapping
sudo apt install -y --no-install-recommends ros-${TARGET_ROS}-stage-ros
sudo apt install -y --no-install-recommends ros-${TARGET_ROS}-teleop-twist-joy
sudo apt install -y --no-install-recommends ros-${TARGET_ROS}-teleop-twist-keyboard
sudo apt install -y --no-install-recommends ros-${TARGET_ROS}-xacro
