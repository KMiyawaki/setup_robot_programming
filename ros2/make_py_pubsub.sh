#!/bin/bash

function main(){
    cd "$(dirname "$0")"
    local -r TARGET_ROS=`./get_suitable_ros2.sh`
    local -r ROS_SETUP="/opt/ros/${TARGET_ROS}/setup.bash"
    local -r WS="${HOME}/ros2_ws"
    local -r PACKAGE="py_pubsub"
    echo "**Making ${PACKAGE}**"
    
    source ${ROS_SETUP}
    cd ${WS}/src
    ros2 pkg create --build-type ament_python ${PACKAGE}
    cd ${WS}/src/${PACKAGE}/${PACKAGE}
    wget https://raw.githubusercontent.com/ros2/examples/humble/rclpy/topics/minimal_publisher/examples_rclpy_minimal_publisher/publisher_member_function.py -O publisher_member_function.py
    wget https://raw.githubusercontent.com/ros2/examples/humble/rclpy/topics/minimal_subscriber/examples_rclpy_minimal_subscriber/subscriber_member_function.py -O subscriber_member_function.py
    cd ${WS}/src/${PACKAGE}
    sed -i -e "s/<\/package>/  <exec_depend>rclpy<\/exec_depend>\\n  <exec_depend>std_msgs<\/exec_depend>\\n<\/package>/g" package.xml
    sed -i -e "s/'console_scripts': \[/'console_scripts': \[\\n            'talker = py_pubsub.publisher_member_function:main',\\n            'listener = py_pubsub.subscriber_member_function:main',/g" setup.py
    cd ${WS}
    rosdep install -i --from-path src --rosdistro ${TARGET_ROS} -y
    colcon build --symlink-install --packages-select ${PACKAGE}
}

main "$@"
