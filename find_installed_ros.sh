#!/bin/bash

function main(){
    local -r ROS_DISTS="kinetic melodic noetic galactic foxy humble"
    for d in ${ROS_DISTS}; do        
        if [ -d /opt/ros/${d} ]; then
            echo "Found installed ros-${d}"
            return 0
        fi
    done
    echo "*** No supported ROS found ***"
    return 1
}

main "$@"
