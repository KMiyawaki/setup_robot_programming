#!/bin/bash
TARGET_ROS=`./get_ros_distoro.sh`
cd ~/catkin_ws/src
git clone https://github.com/KMiyawaki/oit_navigation_microbot_01.git
git clone https://github.com/KMiyawaki/my_microbot_apps.git
git clone https://github.com/MoriKen254/timed_roslaunch.git
cd ~/catkin_ws/src/timed_roslaunch
git checkout -b ${TARGET_ROS}-devel origin/${TARGET_ROS}-devel
cd ~/catkin_ws
catkin_make
