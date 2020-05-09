#!/bin/bash
sudo apt install ros-melodic-roswww -y
sudo apt install ros-melodic-rosbridge-suite -y
sudo apt install ros-melodic-web-video-server -y
sudo apt install ros-melodic-tf2-web-republisher -y
sudo /usr/bin/python2 -m pip install tornado -U
sudo /usr/bin/python2 -m pip install pymongo -U
cd ~/catkin_ws/src
git clone https://github.com/GT-RAIL/robot_pose_publisher.git
cd ..
catkin_make
