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
CMAKE_SOURCE_DIR = /home/ubs-cloud/workspace/helloworld-binding

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ubs-cloud/workspace/helloworld-binding/build

# Utility rule file for htdocs.

# Include the progress variables for this target.
include htdocs/CMakeFiles/htdocs.dir/progress.make

htdocs/CMakeFiles/htdocs: htdocs/htdocs


htdocs/htdocs: ../htdocs/AFB-websock.js
htdocs/htdocs: ../htdocs/assets
htdocs/htdocs: ../htdocs/index.html
htdocs/htdocs: ../htdocs/iotbzh-Binding.css
htdocs/htdocs: ../htdocs/iotbzh-Binding.js
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/ubs-cloud/workspace/helloworld-binding/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating htdocs"
	cd /home/ubs-cloud/workspace/helloworld-binding/build/htdocs && mkdir -p /home/ubs-cloud/workspace/helloworld-binding/build/htdocs/htdocs
	cd /home/ubs-cloud/workspace/helloworld-binding/build/htdocs && touch /home/ubs-cloud/workspace/helloworld-binding/build/htdocs/htdocs
	cd /home/ubs-cloud/workspace/helloworld-binding/build/htdocs && cp -dr /home/ubs-cloud/workspace/helloworld-binding/htdocs/AFB-websock.js /home/ubs-cloud/workspace/helloworld-binding/htdocs/assets /home/ubs-cloud/workspace/helloworld-binding/htdocs/index.html /home/ubs-cloud/workspace/helloworld-binding/htdocs/iotbzh-Binding.css /home/ubs-cloud/workspace/helloworld-binding/htdocs/iotbzh-Binding.js /home/ubs-cloud/workspace/helloworld-binding/build/htdocs/htdocs

htdocs: htdocs/CMakeFiles/htdocs
htdocs: htdocs/htdocs
htdocs: htdocs/CMakeFiles/htdocs.dir/build.make

.PHONY : htdocs

# Rule to build all files generated by this target.
htdocs/CMakeFiles/htdocs.dir/build: htdocs

.PHONY : htdocs/CMakeFiles/htdocs.dir/build

htdocs/CMakeFiles/htdocs.dir/clean:
	cd /home/ubs-cloud/workspace/helloworld-binding/build/htdocs && $(CMAKE_COMMAND) -P CMakeFiles/htdocs.dir/cmake_clean.cmake
.PHONY : htdocs/CMakeFiles/htdocs.dir/clean

htdocs/CMakeFiles/htdocs.dir/depend:
	cd /home/ubs-cloud/workspace/helloworld-binding/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ubs-cloud/workspace/helloworld-binding /home/ubs-cloud/workspace/helloworld-binding/htdocs /home/ubs-cloud/workspace/helloworld-binding/build /home/ubs-cloud/workspace/helloworld-binding/build/htdocs /home/ubs-cloud/workspace/helloworld-binding/build/htdocs/CMakeFiles/htdocs.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : htdocs/CMakeFiles/htdocs.dir/depend

