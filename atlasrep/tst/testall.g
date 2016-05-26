#############################################################################
##
#W  testall.g            GAP 4 package AtlasRep                 Thomas Breuer
##
#Y  Copyright (C)  2002,  Lehrstuhl D fuer Mathematik,  RWTH Aachen,  Germany
##

LoadPackage( "atlasrep" );

dirs:= DirectoriesPackageLibrary( "atlasrep", "tst" );

# Make sure that the component is bound to either `true' or `false'.
if not IsBound( CMeatAxe.FastRead ) or CMeatAxe.FastRead <> true then
  CMeatAxe.FastRead:= false;
fi;

# Run the standard tests with this value.
Test( Filename( dirs, "docxpl.tst" ) );
Test( Filename( dirs, "atlasrep.tst" ) );

# Now run the tests with the other value.
CMeatAxe.FastRead:= not CMeatAxe.FastRead;
Test( Filename( dirs, "docxpl.tst" ) );
Test( Filename( dirs, "atlasrep.tst" ) );

# Reset the value.
CMeatAxe.FastRead:= not CMeatAxe.FastRead;


#############################################################################
##
#E

