#############################################################################
##
##  AutoDoc package
##
##  Copyright 2012-2016
##    Sebastian Gutsche, University of Kaiserslautern
##    Max Horn, Justus-Liebig-Universität Gießen
##
## Licensed under the GPL 2 or later.
##
#############################################################################


#! @Description
#! This is the main function of the &AutoDoc; package. It can perform
#! any combination of the following three tasks:
#! <Enum>
#! <Item>
#!     It can (re)generate a scaffold for your package manual.
#!     That is, it can produce two XML files in &GAPDoc; format to be used as part
#!     of your manual: First, a file named <F>doc/PACKAGENAME.xml</F>
#!     (with your package's name substituted) which is used as
#!     main XML file for the package manual, i.e. this file sets the
#!     XML doctype and defines various XML entities, includes
#!     other XML files (both those generated by &AutoDoc; as well
#!     as additional files created by other means), tells &GAPDoc;
#!     to generate a table of content and an index, and more.
#!     Secondly, it creates a file <F>doc/title.xml</F> containing a title
#!     page for your documentation, with information about your package
#!     (name, description, version), its authors and more, based
#!     on the data in your <F>PackageInfo.g</F>.
#! </Item>
#! <Item>
#!     It can scan your package for &AutoDoc; based documentation (by using &AutoDoc;
#!     tags and the Autodoc command.
#!     This will
#!     produce further XML files to be used as part of the package manual.
#! </Item>
#! <Item>
#!     It can use &GAPDoc; to generate PDF, text and HTML (with
#!     MathJaX enabled) documentation from the &GAPDoc; XML files it
#!     generated as well as additional such files provided by you. For
#!     this, it invokes <Ref Func='MakeGAPDocDoc' BookName='gapdoc'/>
#!     to convert the XML sources, and it also instructs &GAPDoc; to copy
#!     supplementary files (such as CSS style files) into your doc directory
#!     (see <Ref Func='CopyHTMLStyleFiles' BookName='gapdoc'/>).
#! </Item>
#! </Enum>
#! For more information and some examples, please refer to Chapter <Ref Label='Tutorials'/>.
#! <P/>
#! The parameters have the following meanings:
#! <List>
#!
#! <Mark><A>package</A></Mark>
#! <Item>
#!     This is either the name of package, or an <C>IsDirectory</C> object.
#!     In the former case, &AutoDoc; uses the metadata of the first package
#!     with that name known to &GAP;. In the latter case, it checks whether
#!     the given directory contains a <F>PackageInfo.g</F> file, and extracts
#!     all needed metadata from that. This is for example useful if you have
#!     multiple versions of the package around and want to make sure the
#!     documentation of the correct version is built.
#!     <P/>
#!     If this argument is omitted, &AutoDoc; uses the <C>DirectoryCurrent()</C>.
#! </Item>
#!
#!
#! <Mark><A>option_record</A></Mark>
#! <Item>
#!     <A>option_record</A> can be a record with some additional options.
#!     The following are currently supported:
#!     <List>
#!     <Mark><A>dir</A></Mark>
#!     <Item>
#!         This should be a string containing a (relative) path or a
#!         Directory() object specifying where the package documentation
#!         (i.e. the &GAPDoc; XML files) are stored.
#!         <Br/>
#!         <E>Default value: <C>"doc/"</C>.</E>
#!     </Item>
#!     <Mark><A>scaffold</A></Mark>
#!     <Item>
#!         This controls whether and how to generate scaffold XML files
#!         for the package documentation.
#!         <P/>
#!         The value should be either <K>true</K>, <K>false</K> or a
#!         record. If it is a record or <K>true</K> (the latter is
#!         equivalent to specifying an empty record), then this feature is
#!         enabled. It is also enabled if <A>opt.scaffold</A> is missing but the
#!         package's info record in <F>PackageInfo.g</F> has an <C>AutoDoc</C> entry.
#!         In all other cases (in particular if <A>opt.scaffold</A> is
#!         <K>false</K>), scaffolding is disabled.
#!         <P/>
#!         If scaffolding is enabled, and <A>PackageInfo.AutoDoc</A> exists, then it is
#!         assumed to be a record, and its contents are used as default values for
#!         the scaffold settings.
#!         <P/>
#!
#!         If <A>opt.scaffold</A> is a record, it may contain the following entries.
#!
#!         <List>
#!
#!         <Mark><A>includes</A></Mark>
#!         <Item>
#!             A list of XML files to be included in the body of the main XML file.
#!             If you specify this list and also are using &AutoDoc; to document
#!             your operations with &AutoDoc; comments,
#!             you can add <F>_AutoDocMainFile.xml</F> to this list
#!             to control at which point the documentation produced by &AutoDoc;
#!             is inserted. If you do not do this, it will be added after the last
#!             of your own XML files.
#!         </Item>
#!
#!         <Mark><A>index</A></Mark>
#!         <Item>
#!             By default, the scaffold creates an index. If you do not want an index,
#!             set this to <K>false</K>.
#!         </Item>
#!
#!         <Mark><A>appendix</A></Mark>
#!         <Item>
#!             This entry is similar to <A>opt.scaffold.includes</A> but is used
#!             to specify files to include after the main body of the manual,
#!             i.e. typically appendices.
#!         </Item>
#!
#!         <Mark><A>bib</A></Mark>
#!         <Item>
#!             The name of a bibliography file, in Bibtex or XML format.
#!             If this key is not set, but there is a file <F>doc/PACKAGENAME.bib</F>
#!             then it is assumed that you want to use this as your bibliography.
#!         </Item>
#!
#### TODO: The 'entities' param is a bit strange. We should probably change it to be a bit more
#### general, as one might want to define other entities... For now, we do not document it
#### to leave us the choice of revising how it works.
####
####                 <Mark><A>entities</A></Mark>
####                 <Item>
####                     A list of package names or other entities which are used to define corresponding XML entities.
####                     For example, if set to a list containing the string <Q>SomePackage</Q>,
####                     then the following is added to the XML preamble:
####                     <Listing><![CDATA[<!ENTITY SomePackage '<Package>SomePackage</Package>'>]]></Listing>
####                     This allows you to write <Q>&amp;SomePackage;</Q> in your documentation
####                     to reference that package. If another type of entity is desired, one can simply add,
####                     instead of a string, add a two entry list <A>a</A> to the list. It will be handled as
####                     <Listing><![CDATA[<!ENTITY a[ 2 ] '<a[ 1 ]>a[ 2 ]</a[ 1 ]>'>]]></Listing>,
####                     so please be careful.
####                 </Item>
#!
#!         <Mark><A>TitlePage</A></Mark>
#!         <Item>
#!             A record whose entries are used to embellish the generated titlepage
#!             for the package manual with extra information, such as a copyright
#!             statement or acknowledgments. To this end, the names of the record
#!             components are used as XML element names, and the values of the
#!             components are outputted as content of these XML elements. For
#!             example, you could pass the following record to set a custom
#!             acknowledgements text:
#!             <Listing><![CDATA[
#!             rec( Acknowledgements := "Many thanks to ..." )]]></Listing>
#!             For a list of valid entries in the titlepage, please refer to the
#!             &GAPDoc; manual, specifically section <Ref Subsect='TitlePage' BookName='gapdoc'/>.
#!         </Item>
#!         <Mark><A>MainPage</A></Mark>
#!         <Item>
#!             If scaffolding is enabled, by default a main XML file is generated (this
#!             is the file which contains the XML doctype and more). If you do not
#!             want this (e.g. because you have a hand written main XML file), but
#!             still want &AutoDoc; to generate a title page for you, you can set this
#!             option to <K>false</K>
#!         </Item>
#!         <Mark><A>document_class</A></Mark>
#!         <Item>
#!             Sets the document class of the resulting pdf. The value can either be a string
#!             which has to be the name of the new document class, a list containing this string, or
#!             a list of two strings. Then the first one has to be the document class name, the second one
#!             the option string ( contained in [ ] ) in LaTeX.
#!         </Item>
#!         <Mark><A>latex_header_file</A></Mark>
#!         <Item>
#!             Replaces the standard header from &GAPDoc; completely with the header in this LaTeX file.
#!             Please be careful here, and look at GAPDoc's latexheader.tex file for an example.
#!         </Item>
#!         <Mark><A>gapdoc_latex_options</A></Mark>
#!         <Item>
#!             Must be a record with entries which can be understood by SetGapDocLaTeXOptions. Each entry can be a string, which
#!             will be given to &GAPDoc; directly, or a list containing of two entries: The first one must be the string "file",
#!             the second one a filename. This file will be read and then its content is passed to &GAPDoc; as option with the name
#!             of the entry.
#!         </Item>
#!
#!         </List>
#!     </Item>
#!
#!
#!     <Mark><A>autodoc</A></Mark>
#!     <Item>
#!         This controls whether and how to generate addition XML documentation files
#!         by scanning for &AutoDoc; documentation comments.
#!         <P/>
#!         The value should be either <K>true</K>, <K>false</K> or a
#!         record. If it is a record or <K>true</K> (the latter is
#!         equivalent to specifying an empty record), then this feature is
#!         enabled. It is also enabled if <A>opt.autodoc</A> is missing but the
#!         package depends (directly) on the &AutoDoc; package.
#!         In all other cases (in particular if <A>opt.autodoc</A> is
#!         <K>false</K>), this feature is disabled.
#!         <P/>
#!
#!         If <A>opt.autodoc</A> is a record, it may contain the following entries.
#!
#!         <List>
#!
#!         <Mark><A>files</A></Mark>
#!         <Item>
#!             A list of files (given by paths relative to the package directory)
#!             to be scanned for &AutoDoc; documentation comments.
#!             Usually it is more convenient to use <A>autodoc.scan_dirs</A>, see below.
#!         </Item>
#!
#!         <Mark><A>scan_dirs</A></Mark>
#!         <Item>
#!             A list of subdirectories of the package directory (given as relative paths)
#!             which &AutoDoc; then scans for .gi, .gd and .g files; all of these files
#!             are then scanned for &AutoDoc; documentation comments.
#!             <Br/>
#!             <E>Default value: <C>[ "gap", "lib", "examples", "examples/doc" ]</C>.</E>
#!         </Item>
#!
#!         <Mark><A>level</A></Mark>
#!         <Item>
#!             This defines the level of the created documentation. The default value is 0.
#!             When parts of the manual are declared with a higher value
#!             they will not be printed into the manual.
#!         </Item>
#!
#### TODO: Document section_intros later on.
#### However, note that thanks to the new AutoDoc comment syntax, the only remaining
#### use for this seems to be the ability to specify the order of chapters and
#### sections.
####                 <Mark><A>section_intros</A></Mark>
####                 <Item>
####                     TODO.
####                 </Item>
#!
#!         </List>
#!     </Item>
#!
#!
#!     <Mark><A>gapdoc</A></Mark>
#!     <Item>
#!         This controls whether and how to invoke &GAPDoc; to create HTML, PDF and text
#!         files from your various XML files.
#!         <P/>
#!         The value should be either <K>true</K>, <K>false</K> or a
#!         record. If it is a record or <K>true</K> (the latter is
#!         equivalent to specifying an empty record), then this feature is
#!         enabled. It is also enabled if <A>opt.gapdoc</A> is missing.
#!         In all other cases (in particular if <A>opt.gapdoc</A> is
#!         <K>false</K>), this feature is disabled.
#!         <P/>
#!
#!         If <A>opt.gapdoc</A> is a record, it may contain the following entries.
#!
#!         <List>
#!
#!
#### Note: 'main' is strictly speaking also used for the scaffold.
#### However, if one uses the scaffolding mechanism, then it is not
#### really necessary to specify a custom name for the main XML file.
#### Thus, the purpose of this parameter is to cater for packages
#### that have existing documentation using a different XML name,
#### and which do not wish to use scaffolding.
####
#### This explains why we only allow specifying gapdoc.main.
#### The scaffolding code will still honor it, though, just in case.
#!         <Mark><A>main</A></Mark>
#!         <Item>
#!             The name of the main XML file of the package manual.
#!             This exists primarily to support packages with existing manual
#!             which use a filename here which differs from the default.
#!             In particular, specifying this is unnecessary when using scaffolding.
#!             <Br/>
#!             <E>Default value: <C>PACKAGENAME.xml</C></E>.
#!         </Item>
#!
#!         <Mark><A>files</A></Mark>
#!         <Item>
#!             A list of files (given by paths relative to the package directory)
#!             to be scanned for &GAPDoc; documentation comments.
#!             Usually it is more convenient to use <A>gapdoc.scan_dirs</A>, see below.
#!         </Item>
#!
#!         <Mark><A>scan_dirs</A></Mark>
#!         <Item>
#!             A list of subdirectories of the package directory (given as relative paths)
#!             which &AutoDoc; then scans for .gi, .gd and .g files; all of these files
#!             are then scanned for &GAPDoc; documentation comments.
#!             <Br/>
#!             <E>Default value: <C>[ "gap", "lib", "examples", "examples/doc" ]</C>.</E>
#!         </Item>
#!
#!         </List>
#!     </Item>
## This is the maketest part. Still under construction.
#!        <Mark><A>maketest</A></Mark>
#!        <Item>
#!          The maketest item can be true or a record. When it is true,
#!          a simple maketest.g is created in the main package directory,
#!          which can be used to test the examples from the manual. As a record,
#!          the entry can have the following entries itself, to specify some options.
#!          <List>
#!          <Mark>filename</Mark>
#!          <Item>
#!            Sets the name of the test file.
#!          </Item>
#!          <Mark>commands</Mark>
#!          <Item>
#!            A list of strings, each one a command, which
#!            will be executed at the beginning of the test file.
#!          </Item>
#!          </List>
#!        </Item>
#!
#!     </List>
#! </Item>
#! </List>
#!
#! @Returns nothing
#! @Arguments [package[, option_record ]]
#! @ChapterInfo AutoDoc, The AutoDoc() function
DeclareGlobalFunction( "AutoDoc" );