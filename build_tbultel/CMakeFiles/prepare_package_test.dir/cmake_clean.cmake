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
  "CMakeFiles/prepare_package_test"
  "package-test"
  "package-test/bin"
  "package-test/etc"
  "package-test/htdocs"
  "package-test/lib"
  "package-test/var"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/prepare_package_test.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
