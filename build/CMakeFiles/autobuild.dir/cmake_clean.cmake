file(REMOVE_RECURSE
  "../autobuild/agl/autobuild"
  "../autobuild/linux/autobuild"
  "helloworld-binding-debug-test.wgt"
  "helloworld-binding-debug.wgt"
  "CMakeFiles/autobuild"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/autobuild.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
