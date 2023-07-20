# Setup Robot Programming PC

If you want to use WSL, see [this](./WSL.md).
## Clone scripts

```shell
$ sudo apt-get install git -y
$ cd
$ git clone https://github.com/KMiyawaki/setup_robot_programming.git
```

## For Ubuntu 16.04(optional)

```shell
$ cd ~/setup_robot_programming
$ ./fix_ubuntu16_appstreamcli.sh
$ ./fix_ubuntu16_crash_report.sh
```

## Install ROS and other software

```shell
$ cd ~/setup_robot_programming
$ ./stop_update.sh
$ ./install_basic_packages.sh
$ ./install_python_packages.sh
$ ./install_chrome.sh
$ ./add_user_groups.sh
$ ./install_ros1.sh
```

- Close and reopen the terminal.

```shell
$ cd ~/setup_robot_programming
$ source ./init_workspace.sh # Use with source command.
$ ./install_ros_web.sh
$ ./install_microbot.sh
```

## Install VSCode(optional)

```shell
./install_vscode.sh
./install_vscode_extensions.sh
```

## Fix Time Differences in Ubuntu & Windows 10 Dual Boot(optional)

```shell
$ sudo timedatectl set-local-rtc 1
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
$ ./install_microbot.sh
$ ./install_vscode_extensions.sh
$ ./install_japanese.sh # optional
```

## Adapter setting for Virtual Box(optional)

- Set Promiscuous Mode to **Allow All**.

## Test ROS Stage simulator

```shell
$ roscd my_microbot_apps/launch/simulation
$ roslaunch navigation.launch use_teleop:=true
```

- You will see RViz and Stage simulator.
