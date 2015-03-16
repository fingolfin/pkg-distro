## This file is automatically generated
## Standard maketest.g for the homalg project

LoadPackage( "homalg" );
LoadPackage( "Modules" );
Read( "ListOfDocFiles.g" );
example_tree := ExtractExamples( DirectoriesPackageLibrary( "homalg", "doc" )[1]![1], "homalg.xml", list, 500 );
RunExamples( example_tree, rec( compareFunction := "uptowhitespace" ) );
GAPDocManualLab( "homalg" );
QUIT;