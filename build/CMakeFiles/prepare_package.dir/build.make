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

# Utility rule file for prepare_package.

# Include the progress variables for this target.
include CMakeFiles/prepare_package.dir/progress.make

CMakeFiles/prepare_package: package
CMakeFiles/prepare_package: package/bin
CMakeFiles/prepare_package: package/etc
CMakeFiles/prepare_package: package/lib
CMakeFiles/prepare_package: package/htdocs
CMakeFiles/prepare_package: package/var


package:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/ubs-cloud/workspace/helloworld-binding/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating package"
	mkdir -p /home/ubs-cloud/workspace/helloworld-binding/build/package

package/bin: package
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/ubs-cloud/workspace/helloworld-binding/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Generating package/bin"
	mkdir -p /home/ubs-cloud/workspace/helloworld-binding/build/package/bin

package/etc: package
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/ubs-cloud/workspace/helloworld-binding/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Generating package/etc"
	mkdir -p /home/ubs-cloud/workspace/helloworld-binding/build/package/etc

package/lib: package
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/ubs-cloud/workspace/helloworld-binding/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Generating package/lib"
	mkdir -p /home/ubs-cloud/workspace/helloworld-binding/build/package/lib

package/htdocs: package
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/ubs-cloud/workspace/helloworld-binding/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Generating package/htdocs"
	mkdir -p /home/ubs-cloud/workspace/helloworld-binding/build/package/htdocs

package/var: package
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/ubs-cloud/workspace/helloworld-binding/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Generating package/var"
	mkdir -p /home/ubs-cloud/workspace/helloworld-binding/build/package/var

prepare_package: CMakeFiles/prepare_package
prepare_package: package
prepare_package: package/bin
prepare_package: package/etc
prepare_package: package/lib
prepare_package: package/htdocs
prepare_package: package/var
prepare_package: CMakeFiles/prepare_package.dir/build.make

.PHONY : prepare_package

# Rule to build all files generated by this target.
CMakeFiles/prepare_package.dir/build: prepare_package

.PHONY : CMakeFiles/prepare_package.dir/build

CMakeFiles/prepare_package.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/prepare_package.dir/cmake_clean.cmake
.PHONY : CMakeFiles/prepare_package.dir/clean

CMakeFiles/prepare_package.dir/depend:
	cd /home/ubs-cloud/workspace/helloworld-binding/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ubs-cloud/workspace/helloworld-binding /home/ubs-cloud/workspace/helloworld-binding /home/ubs-cloud/workspace/helloworld-binding/build /home/ubs-cloud/workspace/helloworld-binding/build /home/ubs-cloud/workspace/helloworld-binding/build/CMakeFiles/prepare_package.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/prepare_package.dir/depend

