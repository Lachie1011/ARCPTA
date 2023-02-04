#!/bin/bash

# This is a script to clone the required repositories and dependencies needed 
# to install a traversability solution and should be installed in the top level
# of this repository. i.e. /home/<USER>/ARCPTA/

# It builds in conjunction with an existing and working realsense_ws that is
# part of the robotic's clubs pipeline for the D455 stereo camera and hence 
# assumes that the dependenices such as python3 and ROS noetic are already 
# installed in the environment. 

# NOTE: while this has been tested, dependency issues may still occur - 
# any packaged that have had be be installed outside of this list, 
# should be added to this script.

# Script version 0.1 - Only elevation mapping packages includeded
# TODO: Traversability Estimation, Panoptic pipeline

# Checking current working directory:
DIR=$(pwd)

if [[ $DIR != *ARCPTA ]]
then
    echo Not in the top level of ARCPTA! Exiting ...
    exit 1
else
    echo In top level of ARCPTA
fi

cd catkin_ws/src

# Updating package list 
sudo apt-get update

# Installing dependencies needed for the elevation mapping package:
sudo apt install libpcl-dev libeigen3-dev ros-$ROS_DISTRO-grid-map

# Cloning repositories needed:
git clone https://github.com/ANYbotics/kindr.git
git clone https://github.com/ANYbotics/kindr_ros.git
git clone https://github.com/ANYbotics/point_cloud_io.git
git clone https://github.com/ANYbotics/message_logger.git


# Installing dependencies needed to install 
sudo apt-get install ros-noetic-catkin python-catkin-tools 

# Building dependencies
cd ../ 
catkin build 

# Cloning elevation mapping 
cd src
git clone https://github.com/ANYbotics/elevation_mapping.git

# Building elevation mapping 
cd ../
catkin config --cmake-args -DCMAKE_BUILD_TYPE=Release
catkin build


# Pulling repositories and dependencies and needed for the traversbility 
# estimation packages