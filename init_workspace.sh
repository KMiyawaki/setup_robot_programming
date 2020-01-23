#!/bin/bash
echo "**Making workspace**"
CRNT_WD=`pwd`
./setup_emacs.sh
if ! grep -q /opt/ros/melodic/setup.bash ~/.bashrc; then
  echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
  source ~/.bashrc
fi
mkdir -p ~/catkin_ws/src
cd ~/catkin_ws/src/
catkin_init_workspace
cd ..
catkin_make
cd
if ! grep -q /catkin_ws/devel/setup.bash ~/.bashrc; then
  echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc
  source ~/.bashrc
fi
cd ${CRNT_WD}
