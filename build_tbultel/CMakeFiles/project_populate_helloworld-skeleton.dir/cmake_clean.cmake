file(REMOVE_RECURSE
  "helloworld-binding-test.wgt"
  "helloworld-binding.wgt"
  "target/config.xml"
  "target/deb-config.dsc"
  "target/deb-config.install"
  "target/debian.changelog"
  "target/debian.compat"
  "target/debian.control"
  "target/debian.rules"
  "target/gdb-on-root@nuc.ini"
  "target/install-wgt-on-root@nuc.sh"
  "target/rpm-config.spec"
  "target/start-on-root@nuc.sh"
  "target/xds-project-root@nuc.conf"
  "CMakeFiles/project_populate_helloworld-skeleton"
  "package/lib/afb-helloworld-skeleton.so"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/project_populate_helloworld-skeleton.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
