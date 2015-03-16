#############################################################################
##
#W  read.g                   GAP package `kan'                  Chris Wensley
#W                                                            & Anne Heyworth
##  version 1.11, 10/11/2014
##
##  read the actual code

ReadPackage( "kan", "lib/dcrws.gi" ); 
ReadPackage( "kan", "lib/kbrws.gi" ); 

KBMAG_FOR_KAN_PATH := DirectoriesPackagePrograms( "kbmag" ); 
if ( Filename( KBMAG_FOR_KAN_PATH, "kbprog" ) = fail ) then
  Info( InfoWarning, 1, 
    "Package ``kbmag'' is not loaded, so some Kan functions are unavailable" );
else
  ReadPackage( "kan", "lib/dckbmag.gi" );
fi;
