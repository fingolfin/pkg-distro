##  this creates the documentation, needs: GAPDoc package, latex, pdflatex,
##  mkindex, dvips
##
SetInfoLevel( InfoGAPDoc, 2 );

SetGapDocLaTeXOptions( "nocolor", "utf8",
      rec( Maintitlesize := "\\fontsize{50}{55}\\selectfont" ) );
#T change the numbers!

pathtodoc:= ".";
main:= "main.xml";
pkgname:= "AtlasRep";
bookname:= "AtlasRep";
pathtoroot:= "../../..";

files:= [
    "../gap/access.gd",
    "../gap/access.gi",
    "../gap/bbox.gd",
    "../gap/brmindeg.g",
    "../gap/brspor.g",
    "../gap/interfac.gd",
    "../gap/mindeg.gd",
    "../gap/scanmtx.gd",
    "../gap/test.g",
    "../tst/testinst.g",
    "../gap/types.g",
    "../gap/types.gd",
    "../gap/userpref.g",
    "../gap/utils.gd",
  ];

AddHandlerBuildRecBibXMLEntry( "Wrap:Package", "BibTeX",
  function( entry, r, restype, strings, options )
    return Concatenation( "\\textsf{", ContentBuildRecBibXMLEntry(
               entry, r, restype, strings, options ), "}" );
  end );

AddHandlerBuildRecBibXMLEntry( "Wrap:Package", "HTML",
  function( entry, r, restype, strings, options )
    return Concatenation( "<strong class='pkg'>", ContentBuildRecBibXMLEntry(
               entry, r, restype, strings, options ), "</strong>" );
  end );

MakeGAPDocDoc( pathtodoc, main, files, bookname, pathtoroot );;
CopyHTMLStyleFiles( pathtodoc );

GAPDocManualLabFromSixFile( bookname,
    Concatenation( pathtodoc, "/manual.six" ) );


#############################################################################

# Check the consistency of version numbers in 'PackageInfo.g' and the manual.
CheckVersionNumber:= function( pkgname, pathtodoc, main )
    local str, pos, pos2, version1, version2;

    # definition in the manual
    str:= StringFile( Concatenation( pathtodoc, "/", main ) );
    pos:= PositionSublist( str, "<!ENTITY VERSIONNUMBER \"" );
    pos:= Position( str, '\"', pos );
    pos2:= Position( str, '\"', pos );
    version1:= str{ [ pos + 1 .. pos2 - 1 ] };

    # definition in 'PackageInfo.g'
    version2:= PackageInfo( pkgname )[1].Version;

    if version1 <> version2 then
      Error( "version numbers <version1> (from ", main,
             ") and <version2> (from PackageInfo.g) differ" );
    fi;
end;

CheckVersionNumber( pkgname, pathtodoc, main );


#############################################################################

pathtotst:= "../tst";
tstfilename:= "docxpl.tst";
authors:= [ "Thomas Breuer" ];
tstheadertext:= Concatenation( "\
This file contains the GAP code of the examples in the package\n\
documentation files.\n\
\n\
In order to run the tests, one starts GAP from the `tst' subdirectory\n\
of the `pkg/", LowercaseString( pkgname ), "' directory, and calls \
`Test( \"", tstfilename, "\" );'.\n" );

ExampleFileHeader:= function( filename, pkgname, authors, text, linelen,
                              pathtodoc, main )
    local str, pos, pos2, releaseyear, free1, free2, i;

    # definition in the manual
    str:= StringFile( Concatenation( pathtodoc, "/", main ) );
    pos:= PositionSublist( str, "<!ENTITY RELEASEYEAR \"" );
    pos:= Position( str, '\"', pos );
    pos2:= Position( str, '\"', pos );
    releaseyear:= str{ [ pos + 1 .. pos2 - 1 ] };

    free1:= Int( ( linelen - Length( pkgname ) - 14 ) / 2 );
    free2:= linelen - free1 - 14 - Length( pkgname ) - Length( authors[1] );

    str:= RepeatedString( "#", linelen );
    Append( str, "\n##\n#W  " );
    Append( str, filename );
    Append( str, RepeatedString( " ", free1 - Length( filename ) - 4 ) );
    Append( str, "GAP 4 package " );
    Append( str, pkgname );
    Append( str, RepeatedString( " ", free2 ) );
    Append( str, authors[1] );
    for i in [ 2 .. Length( authors ) ] do
      Append( str, "\n#W" );
      Append( str, RepeatedString( " ", linelen - Length( authors[i] ) - 4 ) );
      Append( str, authors[i] );
    od;
    Append( str, "\n##\n#Y  Copyright (C)  " );
    Append( str, releaseyear );
    Append( str, ",   Lehrstuhl D für Mathematik,  RWTH Aachen,  Germany" );
    Append( str, "\n##\n##  " );
    Append( str, ReplacedString( text, "\n", "\n##  " ) );

    Append( str, "\n\ngap> LoadPackage( \"" );
    Append( str, pkgname );
    Append( str, "\", false );\ntrue" );
    Append( str, "\ngap> save:= SizeScreen();;" );
    Append( str, "\ngap> SizeScreen( [ 72 ] );;" );
    Append( str, "\ngap> START_TEST( \"Input file: " );
    Append( str, filename );
    Append( str, "\" );\n" );

    return str;
end;

ExampleFileFooter:= function( filename, linelen )
    local str;

    str:= "\n##\ngap> STOP_TEST( \"";
    Append( str, filename );
    Append( str, "\", 10000000 );\n" );
    Append( str, "gap> SizeScreen( save );;\n\n" );
    Append( str, RepeatedString( "#", linelen ) );
    Append( str, "\n##\n#E\n" );

    return str;
end;


# create the test file with manual examples
# (for a package: combined for all chapters)
CreateManualExamplesFile:= function( pkgname, authors, text,
                                     path, main, files, tstpath, tstfilename )
    local linelen, str, r, l, tstfilenameold;

    linelen:= 77;
    str:= "# This file was created automatically, do not edit!\n";
    Append( str, ExampleFileHeader( tstfilename, pkgname, authors,
                                    text, linelen, path, main ) );
    Append( str, "\n##\ngap> if IsBound( BrowseData ) then\n> oldinterval:= BrowseData.defaults.dynamic.replayDefaults.replayInterval;\n> BrowseData.defaults.dynamic.replayDefaults.replayInterval:= 1;\n> fi;\n" );
    for r in ExtractExamples( path, main, files, "Chapter" ) do
      for l in r do
        Append( str, Concatenation( "\n##  ", l[2][1],
                " (", String( l[2][2] ), "-", String( l[2][3] ), ")" ) );
        Append( str, l[1] );
      od;
    od;
    Append( str, "\n##\ngap> if IsBound( BrowseData ) then\n> BrowseData.defaults.dynamic.replayDefaults.replayInterval:= oldinterval;\n> fi;\n" );
    Append( str, ExampleFileFooter( tstfilename, linelen ) );

    tstfilename:= Concatenation( tstpath, "/", tstfilename );
    tstfilenameold:= Concatenation( tstfilename, "~" );
    if IsExistingFile( tstfilename ) then
      Exec( Concatenation( "rm -f ", tstfilenameold ) );
      Exec( Concatenation( "mv ", tstfilename, " ", tstfilenameold ) );
    fi;
    FileString( tstfilename, str );
    if IsExistingFile( tstfilenameold ) then
      Print( "#I  differences in `", tstfilename, "':\n" );
      Exec( Concatenation( "diff ", tstfilenameold, " ", tstfilename ) );
    fi;
    Exec( Concatenation( "chmod 444 ", tstfilename ) );
end;


CreateManualExamplesFile( pkgname, authors, tstheadertext,
                          pathtodoc, main, files, pathtotst, tstfilename );

