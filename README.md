# Setup Robot Programming PC

```shell
sudo apt install git -y
cd
git clone https://github.com/KMiyawaki/setup_robot_programming.git
cd setup_robot_programming
./stop_update.sh
./install_basic_packages.sh
./install_chrome.sh
./add_user_groups.sh
./install_ros.sh
```

- Close and reopen the terminal.

```shell
cd ~/setup_robot_programming
./install_ros_web.sh
source ./init_workspace.sh # Use with source command.
./install_microbot.sh
```

## Install VSCode(optional)

- **Do not install VSCode into WSL**
  - Use [Visual Studio Code Remote - WSL](https://code.visualstudio.com/docs/remote/wsl)

```shell
./install_vscode.sh
./install_vscode_plugins.sh
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

## Create new user

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
./install_microbot.sh
./install_vscode_plugins.sh
./install_japanese.sh # optional
```
