file(REMOVE_RECURSE
  "helloworld-binding-debug-test.wgt"
  "helloworld-binding-debug.wgt"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/populate.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
