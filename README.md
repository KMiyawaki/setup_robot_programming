# Setup Robot Programming PC

## Clone scripts

```shell
sudo apt install git -y
cd
git clone https://github.com/KMiyawaki/setup_robot_programming.git
```

## For Ubuntu 16.04(optional)

```shell
cd ~/setup_robot_programming
./fix_ubuntu16_appstreamcli.sh
./fix_ubuntu16_crash_report.sh
```

## Install ROS and other software

```shell
cd ~/setup_robot_programming
./stop_update.sh
./install_basic_packages.sh
./install_python_packages.sh
./install_chrome.sh
./add_user_groups.sh
./install_ros.sh
```

- Close and reopen the terminal.

```shell
cd ~/setup_robot_programming
source ./init_workspace.sh # Use with source command.
./install_ros_web.sh
./install_microbot.sh
```

## Install VSCode(optional)

- **Do not install VSCode into WSL**
  - Use [Visual Studio Code Remote - WSL](https://code.visualstudio.com/docs/remote/wsl)

```shell
./install_vscode.sh
./install_vscode_extensions.sh
```

## Fix Time Differences in Ubuntu & Windows 10 Dual Boot(optional)

```shell
sudo timedatectl set-local-rtc 1
```

## Japanese language support(optional)

```shell
cd ~/setup_robot_programming
./install_japanese.sh
```

## Upgrade all ubuntu packages

```shell
cd ~/setup_robot_programming
./upgrade_packages.sh
```

## Create new user(optional)

```shell
cd ~/setup_robot_programming
./create_user.sh new_user_name
```

- Log out, and log in by new_user_name.

```shell
cd
git clone https://github.com/KMiyawaki/setup_robot_programming.git
cd setup_robot_programming
source ./init_workspace.sh # Use with source command.
./install_ros_web.sh
./install_microbot.sh
./install_vscode_plugins.sh
./install_japanese.sh # optional
```

## Setup GUI for WSL(optional)

- WSL only.
- Install X server running on Windows.
  - [VcXsrv](https://sourceforge.net/projects/vcxsrv/)

```shell
sudo apt install x11-apps x11-utils x11-xserver-utils dbus-x11
cd
echo 'export DISPLAY=localhost:0.0' >> ~/.bashrc
echo 'export LIBGL_ALWAYS_INDIRECT=0' >> ~/.bashrc
source ~/.bashrc
```

## Adapter setting for Virtual Box(optional)

- Set Promiscuous Mode to **Allow All**.

## Test ROS Stage simulator

```shell
roscd my_microbot_apps/launch/simulation
roslaunch navigation.launch use_teleop:=true
```

- You will see RViz and Stage simulator.
