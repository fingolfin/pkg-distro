###########################################################################
##  

SetPackageInfo( rec(

PackageName := "SglPPow",
Subtitle := "Database of groups of prime-power order for some prime-powers",
Version := "2.0",
Date := "11/08/2016",

PackageWWWHome
  := "http://www.icm.tu-bs.de/~beick/soft/sglppow/",
ArchiveURL
  := Concatenation( ~.PackageWWWHome, "sglppow-", ~.Version ),
ArchiveFormats := ".tar.gz",
Persons := [
  rec(
    LastName      := "Vaughan-Lee",
    FirstNames    := "Michael",
    IsAuthor      := true,
    IsMaintainer  := true,
    Email         := "michael.vaughan-lee@chch.ox.ac.uk",
    WWWHome       := "http://users.ox.ac.uk/~vlee",
    place         := "Oxford"),
  rec(
    LastName      := "Eick",
    FirstNames    := "Bettina",
    IsAuthor      := true,
    IsMaintainer  := true,
    Email         := "beick@tu-bs.de",
    WWWHome       := "http://www.icm.tu-bs.de/~beick",
    Place         := "TU Braunschweig" ),
],

Status           := "accepted",
CommunicatedBy   := "Leonard Soicher (QMUL)",
AcceptDate       := "08/2016",

README_URL := 
  Concatenation( ~.PackageWWWHome, "README" ),
PackageInfoURL := 
  Concatenation( ~.PackageWWWHome, "PackageInfo.g" ),

AbstractHTML := "",

PackageDoc := rec(
  BookName  := "SglPPow",
  ArchiveURLSubset := ["doc"],
  HTMLStart := "htm/chapters.htm",
  PDFFile   := "doc/manual.pdf",
  SixFile   := "doc/manual.six",
  LongTitle := "Database of groups of prime-power order",
),

AvailabilityTest := ReturnTrue,

Dependencies := rec(
  GAP := "4.5.3",
  NeededOtherPackages := [],
  SuggestedOtherPackages := [["LiePRing", ">=1.8"],["LieRing", ">=2.2"]],
  ExternalConditions := []
),

BannerString := Concatenation(
    "----------------------------------------------------------------\n",
    "Loading SglPPow ", ~.Version, "\n",
    "by Michael Vaughan-Lee and Bettina Eick \n",
    "----------------------------------------------------------------\n" ),

Keywords := ["", "", ""]

));

