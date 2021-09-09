# Setup Robot Programming for WSL

## スクリプトのクローン

```shell
$ git clone https://github.com/KMiyawaki/setup_robot_programming.git
```

もし`git`コマンドが見つからず、エラーがでるようなら`sudo apt-get install git -y`を実行する。

## スクリプトの実行

**終了までに２時間以上かかる場合がある。**

```shell
$ cd ~/setup_robot_programming
$ ./setup_wsl_pbl_ros.sh
```

終了後`WSL`を**再起動**し、`roscore`コマンドを実行してみる。

```shell
$ roscore
... logging to /home/ubuntu/.ros/log/47d3705a-11d4-11ec-af64-80fa5b7fbe40/roslaunch-MyComputer-532.log
Checking log directory for disk usage. This may take a while.
Press Ctrl-C to interrupt
Done checking log file disk usage. Usage is <1GB.

started roslaunch server http://MyComputer:60543/
ros_comm version 1.14.11


SUMMARY
========

PARAMETERS
 * /rosdistro: melodic
 * /rosversion: 1.14.11

NODES

auto-starting new master
process[master]: started with pid [542]
ROS_MASTER_URI=http://MyComputer:11311/

setting /run_id to 47d3705a-11d4-11ec-af64-80fa5b7fbe40
process[rosout-1]: started with pid [556]
started core service [/rosout]
```

結果を確認したら、`Ctrl+C`キーで終了させる。
