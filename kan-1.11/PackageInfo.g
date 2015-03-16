#############################################################################
##
#W  PackageInfo.g                 GAP 4 Package `kan'           Chris Wensley
#W                                                              Anne Heyworth
##  version 1.11, 10/12/2014
##

SetPackageInfo( rec(
PackageName := "kan",
Subtitle := "including double coset rewriting systems",

Version := "1.11",
Date := "10/12/2014",

##  duplicate these values for inclusion in the manual: 
##  <#GAPDoc Label="PKGVERSIONDATA">
##  <!ENTITY VERSION "1.11">
##  <!ENTITY TARFILENAME "kan-1.11.tar.gz">
##  <!ENTITY HTMLFILENAME "kan111.html">
##  <!ENTITY RELEASEDATE "10/12/2014">
##  <!ENTITY LONGRELEASEDATE "10th December 2014">
##  <#/GAPDoc>

PackageWWWHome := 
  "http://pages.bangor.ac.uk/~mas023/chda/kan/",

ArchiveURL := "http://pages.bangor.ac.uk/~mas023/chda/kan/kan-1.11", 
ArchiveFormats := ".tar.gz",

Persons := [
  rec(
    LastName      := "Heyworth",
    FirstNames    := "Anne",
    IsAuthor      := true,
    IsMaintainer  := false
    ## Email         := "" 
  ),
  rec(
    LastName      := "Wensley",
    FirstNames    := "Christopher D.",
    IsAuthor      := true,
    IsMaintainer  := true,
    Email         := "c.d.wensley@bangor.ac.uk",
    WWWHome       := "http://pages.bangor.ac.uk/~mas023/",
    PostalAddress := Concatenation( [
                       "Dr. C.D. Wensley\n",
                       "School of Computer Science\n",
                       "Bangor University\n",
                       "Dean Street\n",
                       "Bangor\n",
                       "Gwynedd LL57 1UT\n",
                       "UK"] ),
    Place         := "Bangor",
    Institution   := "Bangor University"
  )
],

Status := "deposited",
## CommunicatedBy := "",
## AcceptDate := "",

README_URL := 
  Concatenation( ~.PackageWWWHome, "README" ),
PackageInfoURL := 
  Concatenation( ~.PackageWWWHome, "PackageInfo.g" ),

AbstractHTML :=
 "The Kan package provides a collection of functions for computing with \
  all types of Kan extension, including double coset rewriting systems.",

PackageDoc := rec(
  BookName  := "Kan",
  ArchiveURLSubset := ["doc"],
  HTMLStart := "doc/chap0.html",
  PDFFile   := "doc/manual.pdf",
  SixFile   := "doc/manual.six",
  LongTitle := "Computing with Kan extensions" 
),

Dependencies := rec(
  GAP := ">=4.7",
  NeededOtherPackages := [ [ "automata", ">= 1.13" ], 
                           [ "GAPDoc", ">= 1.5.1" ]  ],
  SuggestedOtherPackages := [ [ "kbmag", ">= 1.5" ] ],
  ExternalConditions := [ ]
),

AvailabilityTest := ReturnTrue,

BannerString := Concatenation( 
    "Loading Kan ", String( ~.Version ), " for GAP 4.7", 
    " - Anne Heyworth and Chris Wensley ...\n" ),

Autoload := false,

TestFile := "tst/testall.g",

Keywords := [ "Kan extension", 
              "double coset rewriting system", 
              "induced action" ]

));
