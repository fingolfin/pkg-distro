#############################################################################
##
#W  gp2act.g                 XMOD example files                 Chris Wensley
#W                                                                & Murat Alp
#Y  Copyright (C) 2001-2016, Chris Wensley et al, 
#Y  School of Computer Science, Bangor University, U.K. 
##
#############################################################################

Print("\nXMod example file gp2act.g (version 10/11/15) :-");
Print("\ntesting actor functions\n\n");

s3 := Group( (1,2), (2,3) );  
SetName( s3, "s3" );
X3 := XMod( s3, s3 );

reg3 := RegularDerivations( X3 );
Print("regular derivations of X3 have images list\n" );
imreg3 := ImagesList( reg3 );
Display( imreg3 );
Print("images table for these derivations:\n" );
Display( ImagesTable( reg3 ) );
wgt3 := WhiteheadGroupTable( X3 );
Print("X3 has Whitehead Group Table:\n");
Display( wgt3);
wpg3 := WhiteheadPermGroup( X3 );
gwpg3 := GeneratorsOfGroup( wpg3);
Print("Whitehead perm group wpg3 of X3 is ", wpg3, "\n");
Print("and has generators ", gwpg3, "\n\n");

sgsc3 := StrongGeneratorsStabChain( StabChain( wpg3 ) );
Print("WhitehadPermGroup has StrongGeneratorsStabChain\n", sgsc3, "\n" );
genchi3 := WhiteheadGroupGeneratingDerivations( X3 );
Print("Generating derivations are:\n", genchi3, "\n" );
genmor3 := List( genchi3, c -> Object2dEndomorphism( c ) );
Print("Generating morphisms are:\n", genmor3, "\n\n" );

Print("\n\n=======================================================\n");
Print("\ntesting actor functions\n\n");

zzz := 0;

Print("X1 = ", X1, "\n" );
WGX1 := WhiteheadPermGroup( X1 );
genWGX1 := GeneratorsOfGroup( WGX1 );
Print("\ngenWGX1 = ", genWGX1, "\n" );
APX1 := AutomorphismPermGroup( X1 );
Print("\nAPX1 = ", APX1, "\n" );
genAPX1 := GeneratorsOfGroup( APX1 );
Print("\ngenAPX1 = ", genAPX1, "\n" );
WX1 := WhiteheadXMod( X1 );
Print("\nWhitehead XMod of X1\n");
Display( WX1 );
LX1 := LueXMod( X1 );
Print("\nLue XMod of X1\n");
Display( LX1 );
NX1 := NorrieXMod( X1 );
Print("\nNorrie XMod of X1\n");
Display( NX1 );
AX1 := ActorXMod( X1 );
Print("\nActor XMod of X1\n");
Display( AX1 );
IAX1 := InnerActorXMod( X1 );
Print("\nInnerActor XMod of X1\n");
Display( IAX1 );
IMX1 := InnerMorphism( X1 );
Print("\nInner XMod morphism of X1\n");
Display( IMX1 );
ZX1 := XModCentre( X1 );
Print("\nCentre XMod of X1\n");
Display( ZX1 );

Print("\n\n======================================================\n\n");

d12 := Group( (1,2),(2,3),(4,5));
SetName( d12, "d12");
ed12 := Elements(d12);
c3 := Subgroup(d12,[(1,2,3)]);
SetName(c3,"c3");
X12 := XMod(d12,c3);
Display(X12);
ac3 := AutomorphismGroup( c3 );
## IsomorphismPermObject  should be  NiceMonomorphism  ??  probably not
#ipoac3 := IsomorphismPermObject( ac3 );
#noac3 := NiceObject( ac3 );
#nmac3 := NiceMonomorphism( ac3 );
#Print("\nAutomorphismGroup of c3 has NiceObject/Monomorphism:\n");
#Print( noac3, "\n", MappingGeneratorsImages( nmac3 ), "\n" );
isoac3 := IsomorphismSmallPermGroup( ac3 );
spac3 := Image( isoac3 );
Print("\nAutomorphismGroup of c3 has SmallPermRep:\n");
Print( spac3, "\n", MappingGeneratorsImages( isoac3 ), "\n" );

ad12 := AutomorphismGroup( d12 );
isoad12 := IsomorphismSmallPermGroup( ad12 );
spad12 := Image( isoad12 );
Print("\nAutomorphismGroup of d12 has SmallPermRep:\n");
Print( spad12, "\n", MappingGeneratorsImages( isoad12 ), "\n\n" );

APX12 := AutomorphismPermGroup( X12 );
Print("\nX12 has AutomorphismPermGroup\n", APX12, "\n");
GA12 := GeneratingAutomorphisms( X12 );
Print("\nAutomorphism group of X12 is generated by\n");
Display(GA12);
for i in [1..Length(GA12)] do Display( GA12[i] ); Print("\n"); od;

WP12 := WhiteheadPermGroup( X12 );
Print("X12 has WhiteheadPermGroup\n", WP12, "\n");
WX12 := WhiteheadXMod( X12 );
Print( "\nX12 has WhiteheadXMod" );  Display(WX12);

NX12 := NorrieXMod( X12 );
Print( "X12 has NorrieXMod" );  Display(NX12);
LX12 := LueXMod( X12 );
Print( "X12 has LueXMod" );  Display(LX12);

AX12 := ActorXMod( X12 );
Print("\nThe actor crossed module of X12:\n");
Display(AX12);
imX12 := InnerMorphism( X12 );
Print("\nInner morphism for X12:\n");
Display( imX12 );
Print("\nCentre of X12:\n");
ZX12 := XModCentre( X12 );
Display( ZX12 );
Print("\nInner actor crossed module for X12:\n");
IAX12 := InnerActorXMod( X12 );
Display( IAX12 );

Print("\n\n======================================================\n");
Print("Now for  X33 = (s3 -> s3)\n\n");
s3 := Group((1,2),(2,3));  SetName(s3,"s3");
X33 := XMod( s3, s3 );
Display(X33);

APX33 := AutomorphismPermGroup( X33 );
Print("\nX33 has AutomorphismPermGroup\n", APX33, "\n");
GA33 := GeneratingAutomorphisms( X33 );
Print("\nAutomorphism group of X33 is generated by\n");
Display(GA33);
for i in [1..Length(GA33)] do Display( GA33[i] ); Print("\n"); od;

WP33 := WhiteheadPermGroup( X33 );
Print("X33 has WhiteheadPermGroup\n", WP33, "\n");
WX33 := WhiteheadXMod( X33 );
Print( "\nX33 has WhiteheadXMod" );  Display(WX33);

NX33 := NorrieXMod( X33 );
Print( "X33 has NorrieXMod" );  Display(NX33);
LX33 := LueXMod( X33 );
Print( "X33 has LueXMod" );  Display(LX33);

AX33 := ActorXMod( X33 );
Print("\nThe actor crossed module of X33:\n");
Display(AX33);
imX33 := InnerMorphism( X33 );
Print("\nInner morphism for X33:\n");
Display( imX33 );
Print("\nCentre of X33:\n");
ZX33 := XModCentre( X33 );
Display( ZX33 );
Print("\nInner actor crossed module for X33:\n");
IAX33 := InnerActorXMod( X33 );
Display( IAX33 );

Print("\n\n======================================================\n");
Print("Now for  X44 = (a4 -> s4)\n\n");
s4 := Group((1,2,3,4),(3,4));  
SetName(s4,"s4");
a4 := Subgroup( s4, [(1,2,3),(2,3,4)] ); 
SetName( a4, "a4" );
X44 := XMod( s4, a4 );
Display(X44);

APX44 := AutomorphismPermGroup( X44 );
Print("\nX44 has AutomorphismPermGroup\n", APX44, "\n");
GA44 := GeneratingAutomorphisms( X44 );
Print("\nAutomorphism group of X44 is generated by\n");
Display(GA44);
for i in [1..Length(GA44)] do Display( GA44[i] ); Print("\n"); od;

WP44 := WhiteheadPermGroup( X44 );
Print("X44 has WhiteheadPermGroup\n", WP44, "\n");
WX44 := WhiteheadXMod( X44 );
Print( "\nX44 has WhiteheadXMod" );  Display(WX44);

NX44 := NorrieXMod( X44 );
Print( "X44 has NorrieXMod" );  Display(NX44);
LX44 := LueXMod( X44 );
Print( "X44 has LueXMod" );  Display(LX44);

AX44 := ActorXMod( X44 );
Print("\nThe actor crossed module of X44:\n");
Display(AX44);
imX44 := InnerMorphism( X44 );
Print("\nInner morphism for X44:\n");
Display( imX44 );
Print("\nCentre of X44:\n");
ZX44 := XModCentre( X44 );
Display( ZX44 );
Print("\nInner actor crossed module for X44:\n");
IAX44 := InnerActorXMod( X44 );
Display( IAX44 );

###############################################################################
##
#E  gp2act.g . . . . . . . . . . . . . . . . . . . . . . . . . . . . ends here
