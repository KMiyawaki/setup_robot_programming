#!/bin/bash
TARGET_ROS=`./get_ros_distoro.sh`
echo "Start install ros-${TARGET_ROS} web packages"
sudo apt install ros-${TARGET_ROS}-roswww -y
sudo apt install ros-${TARGET_ROS}-rosbridge-suite -y
sudo apt install ros-${TARGET_ROS}-web-video-server -y
sudo apt install ros-${TARGET_ROS}-tf2-web-republisher -y
sudo /usr/bin/python2 -m pip install tornado -U
sudo /usr/bin/python2 -m pip install pymongo -U
cd ~/catkin_ws/src
git clone https://github.com/GT-RAIL/robot_pose_publisher.git
cd ..
catkin_make
