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

# Utility rule file for project_populate_htdocs.

# Include the progress variables for this target.
include CMakeFiles/project_populate_htdocs.dir/progress.make

CMakeFiles/project_populate_htdocs: package/htdocs/htdocs


package/htdocs/htdocs: htdocs/htdocs
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/ubs-cloud/workspace/helloworld-binding/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating package/htdocs/htdocs"
	mkdir -p /home/ubs-cloud/workspace/helloworld-binding/build/package/htdocs
	touch /home/ubs-cloud/workspace/helloworld-binding/build/package/htdocs
	cp -dr /home/ubs-cloud/workspace/helloworld-binding/build/htdocs/htdocs/* /home/ubs-cloud/workspace/helloworld-binding/build/package/htdocs 2> /dev/null || cp -d /home/ubs-cloud/workspace/helloworld-binding/build/htdocs/htdocs /home/ubs-cloud/workspace/helloworld-binding/build/package/htdocs

project_populate_htdocs: CMakeFiles/project_populate_htdocs
project_populate_htdocs: package/htdocs/htdocs
project_populate_htdocs: CMakeFiles/project_populate_htdocs.dir/build.make

.PHONY : project_populate_htdocs

# Rule to build all files generated by this target.
CMakeFiles/project_populate_htdocs.dir/build: project_populate_htdocs

.PHONY : CMakeFiles/project_populate_htdocs.dir/build

CMakeFiles/project_populate_htdocs.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/project_populate_htdocs.dir/cmake_clean.cmake
.PHONY : CMakeFiles/project_populate_htdocs.dir/clean

CMakeFiles/project_populate_htdocs.dir/depend:
	cd /home/ubs-cloud/workspace/helloworld-binding/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ubs-cloud/workspace/helloworld-binding /home/ubs-cloud/workspace/helloworld-binding /home/ubs-cloud/workspace/helloworld-binding/build /home/ubs-cloud/workspace/helloworld-binding/build /home/ubs-cloud/workspace/helloworld-binding/build/CMakeFiles/project_populate_htdocs.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/project_populate_htdocs.dir/depend

