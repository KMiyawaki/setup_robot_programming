#!/bin/bash
cd ~/catkin_ws/src
git clone https://github.com/KMiyawaki/oit_navigation_microbot_01.git
git clone https://github.com/KMiyawaki/my_microbot_apps.git
git clone https://github.com/MoriKen254/timed_roslaunch.git
cd ~/catkin_ws/src/timed_roslaunch
git checkout -b melodic-devel origin/melodic-devel
cd ~/catkin_ws
catkin_make
