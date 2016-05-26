#############################################################################
##
#W  testinst.g          GAP 4 package AtlasRep                  Thomas Breuer
##
#Y  Copyright (C)  2002,   Lehrstuhl D für Mathematik,  RWTH Aachen,  Germany
##
##  This file contains those tests for the AtlasRep package that are
##  recommended for being executed after the package has been installed.
##  Currently just a few file transfers are tried in the case that
##  <C>AtlasOfGroupRepresentationsInfo.remote</C> is <K>true</K>,
##  and <C>AtlasOfGroupRepresentationsTestTableOfContentsRemoteUpdates</C> is
##  called.
##
##  <#GAPDoc Label="[1]{testinst.g}">
##  For checking the installation of the package, you should start &GAP;
##  and call
##  <P/>
##  <Log><![CDATA[
##  gap> ReadPackage( "atlasrep", "tst/testinst.g" );
##  ]]></Log>
##  <P/>
##  If the installation is o.k.&nbsp;then the &GAP; prompt appears without
##  anything else being printed;
##  otherwise the output lines tell you what should be changed.
##  <P/>
##  More test files are available in the <F>tst</F> directory of the package,
##  see Section&nbsp;
##  <Ref Sect="sect:AGR Sanity Checks"/> for details.
##  <#/GAPDoc>
##

if LoadPackage( "atlasrep" ) <> true then
  Print( "#I  Package `atlasrep' cannot be loaded, no checks are possible.\n",
         "#I  Perhaps look at the output of ",
         "'DisplayPackageLoadingLog( PACKAGE_DEBUG )'.\n" );
else
  # Avoid binding global variables.
  AGR.TestInst:= function()
    local io, wgetpath, wget, bad, msg, pref, filename, filenames, dirs,
          id1, id2, oldfiles, file, newid1, newid2, i, upd;

    if AtlasOfGroupRepresentationsInfo.remote <> true then
      Print( "#I  Package `atlasrep':  ",
             "Access to remote files is switched off,\n",
             "#I    (see the user preference 'AccessRemoteFiles'),\n",
             "#I    nothing is to check.\n" );
      return;
    fi;

    # Check whether the requirements for transferring files are satisfied.
    io:= LoadPackage( "io" ) = true;
    wgetpath:= Filename( DirectoriesSystemPrograms(), "wget" );
    if wgetpath = fail then
      wget:= false;
    else
      wget:= IsExecutableFile( wgetpath );
    fi;
    bad:= false;
    if not ( io or wget ) then
      bad:= true;
      msg:= Concatenation(
         "#I    The system program `wget' and the GAP package `IO' ",
         "are not available.\n",
         "#I    Perhaps set `AtlasOfGroupRepresentationsInfo.remote' ",
         "to `false'\n" );
    elif IsBound( AtlasOfGroupRepresentationsInfo.wget ) then
      if AtlasOfGroupRepresentationsInfo.wget = true then
        if not wget then
          bad:= true;
          msg:= Concatenation(
             "#I    The system program `wget' is not available.\n",
             "#I    Please set the component ",
             "`AtlasOfGroupRepresentationsInfo.wget' to `false'\n" );
        fi;
      elif AtlasOfGroupRepresentationsInfo.wget = false then
        if not io then
          bad:= true;
          msg:= Concatenation(
             "#I    The GAP package `IO' is not available.\n",
             "#I    Please set the component ",
             "`AtlasOfGroupRepresentationsInfo.wget' to `true'\n" );
        fi;
      fi;
    fi;

    if bad then
      Print( "#I  Package `atlasrep':\n", msg );
      return;
    fi;

    # Test whether the data directories are writable.
    bad:= false;
    msg:= "";
    pref:= UserPreference( "AtlasRep", "AtlasRepDataDirectory" );
    filename:= Concatenation( pref, "datagens" );
    if not IsWritableFile( filename ) then
      bad:= true;
      Append( msg, Concatenation(
         "#I    The package directory `datagens'\n",
         "#I    (", filename, ") is not writable.\n" ) );
    fi;
    filename:= Concatenation( pref, "dataword" );
    if not IsWritableFile( filename ) then
      bad:= true;
      Append( msg, Concatenation(
         "#I    The package directory `dataword'\n",
         "#I    (", filename, ") is not writable.\n" ) );
    fi;

    if bad then
      Print( "#I  Package `atlasrep':\n", msg,
             "#I    Perhaps change the AtlasRep data directories using\n",
             "#I    'SetUserPreference( \"AtlasRep\",",
             " \"AtlasRepDataDirectory\", ... )'.\n" );
      return;
    fi;

    # Test transferring group generators in MeatAxe text format.
    # (Remove some files if necessary and access them again.)
    filenames:= [];
    filename:= Concatenation( pref, "datagens" );
    dirs:= [ Directory( filename ) ];
    id1:= OneAtlasGeneratingSet( "A5", Characteristic, 2 );
    if id1 <> fail then
      Append( filenames,
              List( id1.identifier[2], name -> Filename( dirs, name ) ) );
    fi;
    id2:= OneAtlasGeneratingSet( "A5", Characteristic, 0 );
    if id2 <> fail then
      Add( filenames, Filename( dirs, id2.identifier[2] ) );
    fi;
    filenames:= Filtered( filenames, x -> x <> fail );
    if IsEmpty( filenames ) then
      Print( "#I  Package `atlasrep':  ",
             "Transferring data files seems not to work.\n",
             "#I    Perhaps `AtlasOfGroupRepresentationsInfo.remote' ",
             "should be set to `false'.\n" );
    else
      oldfiles:= List( filenames, StringFile  );
      for file in filenames do
        RemoveFile( file );
      od;
      newid1:= OneAtlasGeneratingSet( "A5", Characteristic, 2 );
      newid2:= OneAtlasGeneratingSet( "A5", Characteristic, 0 );
      if    newid1 = fail or newid2 = fail
         or id1 <> newid1 or id2 <> newid2 then
        # Restore the files.
        for i in [ 1 .. Length( filenames ) ] do
          FileString( filenames[i], oldfiles[i] );
        od;
        Print( "#I  Package `atlasrep':  ",
               "Transferring data files does not work.\n",
               "#I    Perhaps `AtlasOfGroupRepresentationsInfo.remote' ",
               "should be set to `false'.\n" );
      else
        # Print information about data files to be removed/updated.
        # (This is for those who had installed an earlier package version.)
        # Note that calling this function requires access to a remote file.
        upd:= AtlasOfGroupRepresentationsTestTableOfContentsRemoteUpdates();
        if upd <> fail and not IsEmpty( upd ) then
          Print( "#I  Remove the following files:\n", upd, "\n" );
        fi;
      fi;
    fi;
  end;

  AGR.TestInst();
fi;


#############################################################################
##
#E

