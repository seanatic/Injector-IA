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

# Utility rule file for test_widget.

# Include the progress variables for this target.
include CMakeFiles/test_widget.dir/progress.make

CMakeFiles/test_widget: helloworld-binding-test.wgt


helloworld-binding-test.wgt: helloworld-skeleton/afb-helloworld-skeleton.so
helloworld-binding-test.wgt: helloworld-subscribe-event/afb-helloworld-subscribe-event.so
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/thierry/Seanatic/ubs-cloud/workspace/helloworld-binding/build_tbultel/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating helloworld-binding-test.wgt"
	/usr/bin/cmake -E cmake_echo_color --yellow Warning:\ Test\ widget\ will\ be\ built\ using\ Zip,\ NOT\ using\ the\ Application\ Framework\ widget\ pack\ command. && cd /home/thierry/Seanatic/ubs-cloud/workspace/helloworld-binding/build_tbultel/package-test && /usr/bin/zip -r ../helloworld-binding-test.wgt *

test_widget: CMakeFiles/test_widget
test_widget: helloworld-binding-test.wgt
test_widget: CMakeFiles/test_widget.dir/build.make

.PHONY : test_widget

# Rule to build all files generated by this target.
CMakeFiles/test_widget.dir/build: test_widget

.PHONY : CMakeFiles/test_widget.dir/build

CMakeFiles/test_widget.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/test_widget.dir/cmake_clean.cmake
.PHONY : CMakeFiles/test_widget.dir/clean

CMakeFiles/test_widget.dir/depend:
	cd /home/thierry/Seanatic/ubs-cloud/workspace/helloworld-binding/build_tbultel && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/thierry/Seanatic/ubs-cloud/workspace/helloworld-binding /home/thierry/Seanatic/ubs-cloud/workspace/helloworld-binding /home/thierry/Seanatic/ubs-cloud/workspace/helloworld-binding/build_tbultel /home/thierry/Seanatic/ubs-cloud/workspace/helloworld-binding/build_tbultel /home/thierry/Seanatic/ubs-cloud/workspace/helloworld-binding/build_tbultel/CMakeFiles/test_widget.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/test_widget.dir/depend

