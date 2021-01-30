# Setup Robot Programming for WSL

## Clone scripts

```shell
$ git clone https://github.com/KMiyawaki/setup_robot_programming.git
```

If `git` command was not found, run `sudo apt-get install git -y`.

## Setup

```shell
$ cd ~/setup_robot_programming
$ ./setup_wsl_pbl_ros.sh
```

Restart WSL.

If you are **NOT** in Japan, add `NOJP` option.

```shell
$ cd ~/setup_robot_programming
$ ./setup_wsl_pbl_ros.sh NOJP
```

### Setup GUI for WSL

Install X server running on Windows.

- [VcXsrv](https://sourceforge.net/projects/vcxsrv/)

```shell
$ cd
$ echo 'export DISPLAY=localhost:0.0' >> ~/.bashrc
$ echo 'export LIBGL_ALWAYS_INDIRECT=0' >> ~/.bashrc
$ source ~/.bashrc
```

## Test ROS Stage simulator

```shell
$ cd ~/catkin_ws/src
$ git clone https://github.com/KMiyawaki/oit_robosim.git
$ cd ~/catkin_ws/src/oit_robosim/launch/simulation
$ roslaunch ./simple.launch
```

You will see RViz and Stage simulator.

## Step by step setup

If you are in Japan, setup Japanese apt mirror.

```shell
$ cd ~/setup_robot_programming
$ ./set_japanese_apt.sh
```

### Install ROS base

```shell
$ cd ~/setup_robot_programming
$ ./install_ros.sh
```

### Install other software and ROS packages

```shell
$ cd ~/setup_robot_programming
$ ./install_basic_packages.sh
$ ./install_python_packages.sh
$ ./install_ros_packages.sh
```

### Install VSCode Extensions

**Do not install VSCode into WSL**

Use [Visual Studio Code Remote - WSL](https://code.visualstudio.com/docs/remote/wsl)

```shell
$ ./install_vscode_extensions_from_file.sh
```

### Upgrade all ubuntu packages

```shell
$ cd ~/setup_robot_programming
$ ./upgrade_packages.sh
```

### Init catkin workspace

```shell
$ cd ~/setup_robot_programming
$ ./init_workspace.sh
$ source ~/.bashrc
```

## Install ROS emacs(optional)

```shell
$ cd ~/setup_robot_programming
$ ./install_ros_emacs.sh
```

### Cleanup APT and /tmp (optional)

```shell
$ cd ~/setup_robot_programming
$ ./cleanup_apt.sh
$ rm -fr /tmp/*
```

This will reduce exported WSL image file size.

## Create new user(optional)

```shell
$ cd ~/setup_robot_programming
$ ./create_user.sh new_user_name
```

Log out, and log in by new_user_name.

```shell
$ cd
$ git clone https://github.com/KMiyawaki/setup_robot_programming.git
$ cd setup_robot_programming
$ source ./init_workspace.sh # Use with source command.
$ ./install_ros_web.sh
$ ./install_vscode_extensions_from_file.sh
$ ./install_japanese.sh # optional
```
