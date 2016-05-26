#############################################################################
##
#W  userpref.g           GAP 4 package AtlasRep                 Thomas Breuer
##
#Y  Copyright (C)  2014,   Lehrstuhl D für Mathematik,  RWTH Aachen,  Germany
##
##  This file contains the declarations of the user preferences for the
##  AtlasRep package.
##


#############################################################################
##
#U  AtlasRepDataDirectory
##
##  <#GAPDoc Label="AtlasRepDataDirectory">
##  <Subsection Label="subsect:AtlasRepDataDirectory">
##  <Heading>User preference <C>AtlasRepDataDirectory</C></Heading>
##
##  The value must be a string that is the filename of a directory
##  (in the sense of <Ref Func="IsDirectoryPath" BookName="ref"/>)
##  that contains the directories <F>datagens</F> and <F>dataword</F>
##  in which downloaded data will be stored.
##  The default is the installation path of the
##  <Package>AtlasRep</Package> package (including a trailing slash symbol).
##  </Subsection>
##  <#/GAPDoc>
##
DeclareUserPreference( rec(
  name:= "AtlasRepDataDirectory",
  description:= [
    "The value must be a string that is the filename of a directory \
(in the sense of 'IsDirectoryPath') \
that contains the directories 'datagens' and 'dataword' \
in which those data will be stored that have to be downloaded. \
The default is the installation path of the AtlasRep package \
(including a trailing slash symbol)."
    ],
  default:= Filename( DirectoriesPackageLibrary( "atlasrep", "" ), "" ),
  package:= "AtlasRep",
  check:= function( val )
    local name;

    if not ( IsString( val ) and IsDirectoryPath( val ) ) then
      Info( InfoWarning, 1,
            "the value of the preference 'AtlasRepDataDirectory' must be ",
            "a directory path" );
      return false;
    elif val[ Length( val ) ] <> '/' then
      Info( InfoWarning, 1,
            "the value of the preference 'AtlasRepDataDirectory' must end ",
            "with '/'" );
      return false;
    fi;
    for name in [ "datagens", "dataword" ] do
      if not IsDirectoryPath( Concatenation( val, name ) ) then
        Info( InfoWarning, 1,
              "the directory given by the preference ",
              "'AtlasRepDataDirectory'\n",
              "#I  must contain subdirectories 'datagens' and 'dataword'" );
        return false;
      fi;
    od;

    return true;
  end,
  ) );


#############################################################################
##
#U  WriteMeatAxeFilesOfMode2
##
##  <#GAPDoc Label="WriteMeatAxeFilesOfMode2">
##  <Subsection Label="subsect:WriteMeatAxeFilesOfMode2">
##  <Heading>User preference <C>WriteMeatAxeFilesOfMode2</C></Heading>
##
##  The value <K>true</K> means that the function <Ref Func="MeatAxeString"/>
##  will encode permutation matrices via mode 2 descriptions, that is,
##  the first entry in the header line is 2, and the following lines contain
##  the positions of the nonzero entries.
##  If the value is <K>false</K> (the default) then
##  <Ref Func="MeatAxeString"/> encodes permutation matrices
##  via mode 1 or mode 6 descriptions, that is,
##  the lines contain the matrix entries.
##  </Subsection>
##  <#/GAPDoc>
##
DeclareUserPreference( rec(
  name:= "WriteMeatAxeFilesOfMode2",
  description:= [
    "The value 'true' means that the function 'MeatAxeString' \
will encode permutation matrices via mode 2 descriptions, that is, \
the first entry in the header line is 2, and the following lines contain \
the positions of the nonzero entries.  \
If the value is 'false' (the default) then 'MeatAxeString' encodes \
permutation matrices via mode 1 or mode 6 descriptions, that is, \
the lines contain the matrix entries."
    ],
  default:= false,
  values:= [ true, false ],
  multi:= false,
  package:= "AtlasRep",
  ) );


#############################################################################
##
#U  BaseOfMeatAxePermutation
##
##  <#GAPDoc Label="BaseOfMeatAxePermutation">
##  <Subsection Label="subsect:BaseOfMeatAxePermutation">
##  <Heading>User preference <C>BaseOfMeatAxePermutation</C></Heading>
##
##  The value <M>0</M> means that the function
##  <Ref Func="CMtxBinaryFFMatOrPerm"/> writes zero-based permutations,
##  that is, permutations acting on the points from <M>0</M> to the
##  degree minus one; this is achieved by shifting down all images of the
##  &GAP; permutation by one.
##  The value <M>1</M> (the default) means that the permutation stored in the
##  binary file acts on the points from <M>1</M> to the degree.
##  <P/>
##  Up to version&nbsp;2.3 of the <C>C</C>-&MeatAxe;, permutations in
##  binary files were always one-based.
##  Zero-based permutations were introduced in version&nbsp;2.4,
##  which still is able to read files containing one-based permutations.
##  </Subsection>
##  <#/GAPDoc>
##
DeclareUserPreference( rec(
  name:= "BaseOfMeatAxePermutation",
  description:= [
    "The value 0 means that the function 'CMtxBinaryFFMatOrPerm' \
writes zero-based permutations, \
that is, permutations acting on the points from 0 to the \
degree minus one; this is achieved by shifting down all images of the \
GAP permutation by one.  \
The value 1 (the default) means that the permutation stored in the \
binary file acts on the points from 1 to the degree."
    ],
  default:= 1,
  values:= [ 0, 1 ],
  multi:= false,
  package:= "AtlasRep",
  ) );


#############################################################################
##
#E

