#!/bin/bash

TARGET_ROS=`./get_ros_distoro.sh`
echo "Start install ros-${TARGET_ROS} turtlebot packages"
sudo apt install -y --no-install-recommends ros-${TARGET_ROS}-gazebo-ros
sudo apt install -y --no-install-recommends ros-${TARGET_ROS}-turtlebot3-msgs
sudo apt install -y --no-install-recommends ros-${TARGET_ROS}-turtlebot3
cd ~/catkin_ws/src
git clone -b ${TARGET_ROS}-devel https://github.com/ROBOTIS-GIT/turtlebot3_simulations.git

if ! grep -q TURTLEBOT3_MODEL ~/.bashrc; then
  echo "export TURTLEBOT3_MODEL=burger" >> ~/.bashrc
  source ~/.bashrc
fi

cd ~/catkin_ws
catkin_make

# https://qiita.com/k-koh/items/d99ab9b0964c7f994cf1
cd ~/.ignition/fuel
sudo sed -i 's/api.ignitionfuel/api.ignitionrobotics/g' config.yaml
