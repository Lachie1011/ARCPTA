# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/lachie/ARCPTA/catkin_ws/src/point_cloud_io

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/lachie/ARCPTA/catkin_ws/build/point_cloud_io

# Utility rule file for run_tests_point_cloud_io_gtest_test_point_cloud_io.

# Include the progress variables for this target.
include CMakeFiles/run_tests_point_cloud_io_gtest_test_point_cloud_io.dir/progress.make

CMakeFiles/run_tests_point_cloud_io_gtest_test_point_cloud_io:
	catkin_generated/env_cached.sh /usr/bin/python3 /opt/ros/noetic/share/catkin/cmake/test/run_tests.py /home/lachie/ARCPTA/catkin_ws/build/point_cloud_io/test_results/point_cloud_io/gtest-test_point_cloud_io.xml "/home/lachie/ARCPTA/catkin_ws/devel/.private/point_cloud_io/lib/point_cloud_io/test_point_cloud_io --gtest_output=xml:/home/lachie/ARCPTA/catkin_ws/build/point_cloud_io/test_results/point_cloud_io/gtest-test_point_cloud_io.xml"

run_tests_point_cloud_io_gtest_test_point_cloud_io: CMakeFiles/run_tests_point_cloud_io_gtest_test_point_cloud_io
run_tests_point_cloud_io_gtest_test_point_cloud_io: CMakeFiles/run_tests_point_cloud_io_gtest_test_point_cloud_io.dir/build.make

.PHONY : run_tests_point_cloud_io_gtest_test_point_cloud_io

# Rule to build all files generated by this target.
CMakeFiles/run_tests_point_cloud_io_gtest_test_point_cloud_io.dir/build: run_tests_point_cloud_io_gtest_test_point_cloud_io

.PHONY : CMakeFiles/run_tests_point_cloud_io_gtest_test_point_cloud_io.dir/build

CMakeFiles/run_tests_point_cloud_io_gtest_test_point_cloud_io.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/run_tests_point_cloud_io_gtest_test_point_cloud_io.dir/cmake_clean.cmake
.PHONY : CMakeFiles/run_tests_point_cloud_io_gtest_test_point_cloud_io.dir/clean

CMakeFiles/run_tests_point_cloud_io_gtest_test_point_cloud_io.dir/depend:
	cd /home/lachie/ARCPTA/catkin_ws/build/point_cloud_io && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/lachie/ARCPTA/catkin_ws/src/point_cloud_io /home/lachie/ARCPTA/catkin_ws/src/point_cloud_io /home/lachie/ARCPTA/catkin_ws/build/point_cloud_io /home/lachie/ARCPTA/catkin_ws/build/point_cloud_io /home/lachie/ARCPTA/catkin_ws/build/point_cloud_io/CMakeFiles/run_tests_point_cloud_io_gtest_test_point_cloud_io.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/run_tests_point_cloud_io_gtest_test_point_cloud_io.dir/depend

