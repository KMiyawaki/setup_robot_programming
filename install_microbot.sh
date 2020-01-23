#!/bin/bash
#pip2
sudo /usr/bin/python2 -m pip install pycrc -U
cd ~/catkin_ws/src
git clone https://github.com/KMiyawaki/oit_navigation_microbot_01.git
git clone https://github.com/KMiyawaki/oit_roboclaw_driver.git
git clone https://github.com/KMiyawaki/my_microbot_apps.git
git clone https://github.com/YDLIDAR/ydlidar_ros.git
git clone https://github.com/MoriKen254/timed_roslaunch.git
cd ~/catkin_ws/src/ydlidar_ros
git checkout refs/tags/1.4.1
cd ~/catkin_ws/src/timed_roslaunch
git checkout -b melodic-devel origin/melodic-devel
cd ~/catkin_ws
catkin_make
cd ~/catkin_ws/src/ydlidar_ros/startup
sudo sh initenv.sh 
