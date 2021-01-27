# Setup Robot Programming for WSL

## Clone scripts

```shell
$ sudo apt install git -y
$ cd
$ git clone https://github.com/KMiyawaki/setup_robot_programming.git
```

## Install ROS and other software

```shell
$ cd ~/setup_robot_programming
$ ./install_basic_packages.sh
$ ./install_python_packages.sh
$ ./install_ros.sh
```

- Close and reopen the terminal.

```shell
$ cd ~/setup_robot_programming
$ source ./init_workspace.sh # Use with source command.
$ ./install_ros_web.sh
```

## Install VSCode Extensions

- **Do not install VSCode into WSL**
  - Use [Visual Studio Code Remote - WSL](https://code.visualstudio.com/docs/remote/wsl)

```shell
$ ./install_vscode_extensions_from_file.sh
```

## Japanese language support(optional)

```shell
$ cd ~/setup_robot_programming
$ ./install_japanese.sh
```

## Upgrade all ubuntu packages

```shell
$ cd ~/setup_robot_programming
$ ./upgrade_packages.sh
```

## Create new user(optional)

```shell
$ cd ~/setup_robot_programming
$ ./create_user.sh new_user_name
```

- Log out, and log in by new_user_name.

```shell
$ cd
$ git clone https://github.com/KMiyawaki/setup_robot_programming.git
$ cd setup_robot_programming
$ source ./init_workspace.sh # Use with source command.
$ ./install_ros_web.sh
$ ./install_vscode_extensions_from_file.sh
$ ./install_japanese.sh # optional
```

## Setup GUI for WSL

- Install X server running on Windows.
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

- You will see RViz and Stage simulator.

## Cleanup APT and /tmp (optional)

```shell
$ cd ~/setup_robot_programming
$ ./cleanup_apt.sh
$ rm -fr /tmp/*
```

This will reduce exported WSL image file size.
