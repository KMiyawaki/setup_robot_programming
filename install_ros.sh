#!/bin/bash
TARGET_ROS=`./get_ros_distoro.sh`
echo "Start install ros-${TARGET_ROS}"
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
sudo apt update
sudo apt install ros-${TARGET_ROS}-desktop -y
sudo apt install python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential python-catkin-tools -y
sudo rosdep init
rosdep update
if ! grep -q /opt/ros/${TARGET_ROS}/setup.bash ~/.bashrc; then
  echo "source /opt/ros/${TARGET_ROS}/setup.bash" >> ~/.bashrc
  source ~/.bashrc
fi
# ROS packages
sudo apt install ros-${TARGET_ROS}-rosemacs -y
./setup_emacs.sh
sudo apt install ros-${TARGET_ROS}-image-transport -y
sudo apt install ros-${TARGET_ROS}-image-transport-plugins -y
sudo apt install ros-${TARGET_ROS}-navigation -y
sudo apt install ros-${TARGET_ROS}-joy -y
sudo apt install ros-${TARGET_ROS}-teleop-twist-joy -y
sudo apt install ros-${TARGET_ROS}-laser-filters -y
sudo apt install ros-${TARGET_ROS}-laser-pipeline -y
sudo apt install ros-${TARGET_ROS}-slam-gmapping -y
sudo apt install ros-${TARGET_ROS}-map-server -y
sudo apt install ros-${TARGET_ROS}-cv-camera -y
sudo apt install ros-${TARGET_ROS}-teleop-twist-keyboard -y
sudo apt install ros-${TARGET_ROS}-mouse-teleop -y
sudo apt install ros-${TARGET_ROS}-joint-state-publisher-gui -y
sudo apt install ros-${TARGET_ROS}-xacro
sudo apt install ros-${TARGET_ROS}-rviz
sudo apt install ros-${TARGET_ROS}-rosbash
sudo apt install ros-${TARGET_ROS}-robot-stage-publisher
echo "**Done**"
