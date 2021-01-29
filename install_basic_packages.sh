#!/bin/bash
sudo apt update
sudo apt install -y --no-install-recommends curl
sudo apt install -y --no-install-recommends emacs
sudo apt install -y --no-install-recommends net-tools
sudo apt install -y --no-install-recommends openssh-server
sudo apt install -y --no-install-recommends python-pip
sudo apt install -y --no-install-recommends python3-pip
sudo apt install -y --no-install-recommends python3-setuptools
sudo apt install -y --no-install-recommends zip unzip
sudo apt install -y --no-install-recommends x11-apps x11-utils x11-xserver-utils dbus-x11

# emacs
if [ ! -d ~/.emacs.d ]; then
  mkdir ~/.emacs.d
fi
if [ ! -e ~/.emacs.d/init.el ]; then
  touch ~/.emacs.d/init.el
fi
if ! grep -q "(setq inhibit-startup-message t)" ~/.emacs.d/init.el; then
  echo "(setq inhibit-startup-message t)" >> ~/.emacs.d/init.el
fi
