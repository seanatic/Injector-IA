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

# Utility rule file for autobuild.

# Include the progress variables for this target.
include CMakeFiles/autobuild.dir/progress.make

CMakeFiles/autobuild: ../autobuild/agl/autobuild
CMakeFiles/autobuild: ../autobuild/linux/autobuild


../autobuild/agl/autobuild: /usr/share/cmake-3.16/Modules/CMakeAfbTemplates/template.d/autobuild/rp/autobuild.in
../autobuild/agl/autobuild: /usr/share/cmake-3.16/Modules/CMakeAfbTemplates/template.d/autobuild/linux/autobuild.in
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/ubs-cloud/workspace/helloworld-binding/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating ../autobuild/agl/autobuild, ../autobuild/linux/autobuild"
	[ ! -f /home/ubs-cloud/workspace/helloworld-binding/autobuild/agl/autobuild ] && /usr/bin/cmake -DINFILE=/usr/share/cmake-3.16/Modules/CMakeAfbTemplates/cmake/cmake.d/../../template.d/autobuild/rp/autobuild.in -DOUTFILE=/home/ubs-cloud/workspace/helloworld-binding/autobuild/agl/autobuild -DPROJECT_BINARY_DIR=/home/ubs-cloud/workspace/helloworld-binding/build -P /usr/share/cmake-3.16/Modules/CMakeAfbTemplates/cmake/cmake.d/../../cmake/configure_file.cmake && chmod a+x /home/ubs-cloud/workspace/helloworld-binding/autobuild/agl/autobuild || true
	[ ! -f /home/ubs-cloud/workspace/helloworld-binding/autobuild/linux/autobuild ] && /usr/bin/cmake -DINFILE=/usr/share/cmake-3.16/Modules/CMakeAfbTemplates/cmake/cmake.d/../../template.d/autobuild/rp/autobuild.in -DOUTFILE=/home/ubs-cloud/workspace/helloworld-binding/autobuild/linux/autobuild -DPROJECT_BINARY_DIR=/home/ubs-cloud/workspace/helloworld-binding/build -P /usr/share/cmake-3.16/Modules/CMakeAfbTemplates/cmake/cmake.d/../../cmake/configure_file.cmake && chmod a+x /home/ubs-cloud/workspace/helloworld-binding/autobuild/linux/autobuild || true

../autobuild/linux/autobuild: ../autobuild/agl/autobuild
	@$(CMAKE_COMMAND) -E touch_nocreate ../autobuild/linux/autobuild

autobuild: CMakeFiles/autobuild
autobuild: ../autobuild/agl/autobuild
autobuild: ../autobuild/linux/autobuild
autobuild: CMakeFiles/autobuild.dir/build.make

.PHONY : autobuild

# Rule to build all files generated by this target.
CMakeFiles/autobuild.dir/build: autobuild

.PHONY : CMakeFiles/autobuild.dir/build

CMakeFiles/autobuild.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/autobuild.dir/cmake_clean.cmake
.PHONY : CMakeFiles/autobuild.dir/clean

CMakeFiles/autobuild.dir/depend:
	cd /home/ubs-cloud/workspace/helloworld-binding/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ubs-cloud/workspace/helloworld-binding /home/ubs-cloud/workspace/helloworld-binding /home/ubs-cloud/workspace/helloworld-binding/build /home/ubs-cloud/workspace/helloworld-binding/build /home/ubs-cloud/workspace/helloworld-binding/build/CMakeFiles/autobuild.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/autobuild.dir/depend

