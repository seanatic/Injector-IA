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
CMAKE_SOURCE_DIR = /home/thierry/Seanatic/ubs-cloud/workspace/helloworld-binding

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/thierry/Seanatic/ubs-cloud/workspace/helloworld-binding/build_tbultel

# Utility rule file for project_populate_test-files.

# Include the progress variables for this target.
include CMakeFiles/project_populate_test-files.dir/progress.make

CMakeFiles/project_populate_test-files: package-test/var/test-files


package-test/var/test-files: test/afb-test/tests/test-files
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/thierry/Seanatic/ubs-cloud/workspace/helloworld-binding/build_tbultel/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating package-test/var/test-files"
	mkdir -p /home/thierry/Seanatic/ubs-cloud/workspace/helloworld-binding/build_tbultel/package-test/var
	touch /home/thierry/Seanatic/ubs-cloud/workspace/helloworld-binding/build_tbultel/package-test/var
	cp -dr /home/thierry/Seanatic/ubs-cloud/workspace/helloworld-binding/build_tbultel/test/afb-test/tests/test-files/* /home/thierry/Seanatic/ubs-cloud/workspace/helloworld-binding/build_tbultel/package-test/var 2> /dev/null || cp -d /home/thierry/Seanatic/ubs-cloud/workspace/helloworld-binding/build_tbultel/test/afb-test/tests/test-files /home/thierry/Seanatic/ubs-cloud/workspace/helloworld-binding/build_tbultel/package-test/var

project_populate_test-files: CMakeFiles/project_populate_test-files
project_populate_test-files: package-test/var/test-files
project_populate_test-files: CMakeFiles/project_populate_test-files.dir/build.make

.PHONY : project_populate_test-files

# Rule to build all files generated by this target.
CMakeFiles/project_populate_test-files.dir/build: project_populate_test-files

.PHONY : CMakeFiles/project_populate_test-files.dir/build

CMakeFiles/project_populate_test-files.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/project_populate_test-files.dir/cmake_clean.cmake
.PHONY : CMakeFiles/project_populate_test-files.dir/clean

CMakeFiles/project_populate_test-files.dir/depend:
	cd /home/thierry/Seanatic/ubs-cloud/workspace/helloworld-binding/build_tbultel && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/thierry/Seanatic/ubs-cloud/workspace/helloworld-binding /home/thierry/Seanatic/ubs-cloud/workspace/helloworld-binding /home/thierry/Seanatic/ubs-cloud/workspace/helloworld-binding/build_tbultel /home/thierry/Seanatic/ubs-cloud/workspace/helloworld-binding/build_tbultel /home/thierry/Seanatic/ubs-cloud/workspace/helloworld-binding/build_tbultel/CMakeFiles/project_populate_test-files.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/project_populate_test-files.dir/depend
