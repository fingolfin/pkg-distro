##############################################################################
##
#W  files.gd                    GAP4 package `Utils'         Sebastian Gutsche
##                                                                    Max Horn
##                                                                 Stefan Kohl
#Y  Copyright (C) 2015-2016, The GAP Group 

#############################################################################
##  these functions have been transferred from AutoDoc 
##  they were originally named AUTODOC_CreatreDirIfMissing 
##  and AUTODOC_FindMatchingFiles
##
#F  CreateDirIfMissing( <str> )
#F  FindMatchingFiles( <args> )
##
DeclareGlobalFunction( "CreateDirIfMissing" );
DeclareGlobalFunction( "FindMatchingFiles" );

if OKtoReadFromUtils( "RCWA" ) then

#############################################################################
##  this function has been transferred from RCWA 
##
#F  Log2HTML ( logfilename )
##
##  Utility to convert GAP log files to XHTML 1.0 Strict.
##
##  Usage:
##
##  - Issue Log2HTML( <logfilename> ). The extension of the input file must
##    be *.log. The name of the output file is the same as the one of the
##    input file except that the extension *.log is replaced by *.html.
##
##  - Adapt the style file rcwa/doc/gaplog.css to your taste.
##
DeclareGlobalFunction( "Log2HTML" );

fi;

#############################################################################
##
#E  files.gd  . . . . . . . . . . . . . . . . . . . . . . . . . . . ends here
