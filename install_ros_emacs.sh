#!/bin/bash
TARGET_ROS=`./get_ros_distoro.sh`
if [ ! -d ~/.emacs.d ]; then
  mkdir ~/.emacs.d
fi
if [ ! -e ~/.emacs.d/init.el ]; then
  touch ~/.emacs.d/init.el
fi
sudo apt-get install -y --no-install-recommends ros-${TARGET_ROS}-rosemacs
if ! grep -q "(add-to-list 'load-path \"/opt/ros/${TARGET_ROS}/share/emacs/site-lisp\")" ~/.emacs.d/init.el; then
  echo "(add-to-list 'load-path \"/opt/ros/${TARGET_ROS}/share/emacs/site-lisp\")" >> ~/.emacs.d/init.el
fi
if ! grep -q "(require 'rosemacs-config)" ~/.emacs.d/init.el; then
  echo "(require 'rosemacs-config)" >> ~/.emacs.d/init.el
fi
