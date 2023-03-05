#!/bin/bash

# This is a script to clone the required repositories and dependencies needed 
# to install a traversability solution and should be installed in the top level
# of this repository. i.e. /home/<USER>/ARCPTA/

# It assumes dependencies such as python3 and ROS noetic are already 
# installed in the environment. 

# NOTE: while this has been tested, dependency issues may still occur - 
# any packages that have had be be installed outside of this list, 
# should be added to this script.

# Script version 0.4: 
#    - Elevation mapping and Traversability packages included
#    - Realsense-ros packages included and building 
#    - Added functionality to pull down rosbags

# TODO: Panoptic pipeline

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

# Installing dependencies needed for build 
sudo apt-get install ros-$ROS_DISTRO-catkin python3-catkin-tools 

# Installing dependencies needed for realsense-ros pkg 
sudo apt-get install ros-$ROS_DISTRO-realsense2-camera

# Installing dependencies needed for the elevation mapping package:
sudo apt install libpcl-dev libeigen3-dev ros-$ROS_DISTRO-grid-map

# Repositories needed for realsense-ros
git clone https://github.com/Lachie1011/realsense-ros.git

# Repositories needed for elevation mapping:
git clone https://github.com/ANYbotics/kindr.git
git clone https://github.com/ANYbotics/kindr_ros.git
git clone https://github.com/ANYbotics/point_cloud_io.git
git clone https://github.com/ANYbotics/message_logger.git

# Repositories needed for traversability estimation:
git clone https://github.com/leggedrobotics/any_node.git

# Building dependencies first - elevation mapping fails unless this is done
cd ../ 
#catkin build 

# Cloning elevation mapping and traversability estimation from forks
cd src
git clone https://github.com/Lachie1011/elevation_mapping.git
git clone https://github.com/Lachie1011/traversability_estimation.git

# Building elevation mapping and traversability estimation in Release
cd ../
catkin config --cmake-args -DCMAKE_BUILD_TYPE=Release
catkin build elevation_mapping elevation_mapping_demos traversability_estimation

# Grabbing external data stored on google drive - optional 
read -p "Do you want to download external data? <y/N>" prompt
if [[ $prompt == "y" || $prompt == "Y" || $prompt == "yes" || $prompt == "Yes" ]]
then
    pip3 install gdown
    export PATH="$HOME/.local/bin:$PATH" #  had to add bin to python path
    cd ../
    mkdir rosbags 
    cd rosbags
    gdown https://drive.google.com/file/d/1TOQ-mwWQ99SwDiZRuVhLLJEManJwJw4y/view?usp=share_link --fuzzy
    unzip rosbags.zip
else
  exit 0
fi