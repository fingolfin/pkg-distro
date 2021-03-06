## This file is automatically generated by AutoDoc.
## Changes will be discarded by the next call of the AutoDoc method.


LoadPackage("NormalizInterface");

AUTODOC_file_scan_list := [ "../PackageInfo.g", "../examples/5x5.g", "../examples/demo.g", "../examples/docs.g", "../examples/dual_mode.g", "../examples/magic_square.g", "../init.g", "../lib/cone_property_wrappers.gd", "../lib/cone_property_wrappers.gi", "../lib/normaliz.gd", "../lib/normaliz.gi", "../makedoc.g", "../read.g" ];

LoadPackage( "GAPDoc" );

example_tree := ExtractExamples( Directory("./doc/"), "NormalizInterface.xml", AUTODOC_file_scan_list, 500 );

RunExamples( example_tree, rec( compareFunction := "uptowhitespace" ) );

QUIT;
