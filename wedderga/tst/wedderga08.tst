# wedderga, chapter 8

# [ "/Users/alexk/gap4r7p8/pkg/wedderga/doc/applications.xml", 26, 39 ]

gap> G:=DihedralGroup(8);;
gap> F:=GF(3);;          
gap> FG:=GroupRing(F,G);;
gap> a:=AsList(FG)[27];
(Z(3)^0)*<identity> of ...+(Z(3)^0)*f1+(Z(3)^0)*f2+(Z(3)^0)*f3+(Z(3)^
0)*f1*f2+(Z(3)^0)*f2*f3+(Z(3))*f1*f2*f3
gap> S:=AsSet(G);
[ <identity> of ..., f1, f2, f3, f1*f2, f1*f3, f2*f3, f1*f2*f3 ]
gap> CodeWordByGroupRingElement(F,S,a);
[ Z(3)^0, Z(3)^0, Z(3)^0, Z(3)^0, Z(3)^0, 0*Z(3), Z(3)^0, Z(3) ]


# [ "/Users/alexk/gap4r7p8/pkg/wedderga/doc/applications.xml", 61, 94 ]

gap> G:=DihedralGroup(8);;
gap> F:=GF(3);;          
gap> FG:=GroupRing(F,G);;
gap> S:=AsSet(G);
[ <identity> of ..., f1, f2, f3, f1*f2, f1*f3, f2*f3, f1*f2*f3 ]
gap> H:=StrongShodaPairs(G)[5][1];
Group([ f1*f2, f3, f3 ])
gap> K:=StrongShodaPairs(G)[5][2];
Group([ f1*f2 ])
gap> N:=Normalizer(G,K);
Group([ f1*f2*f3, f3 ])
gap> epi:=NaturalHomomorphismByNormalSubgroup(N,K);
[ f1*f2*f3, f3 ] -> [ f1, f1 ]
gap> QHK:=Image(epi,H);
Group([ <identity> of ..., f1, f1 ])
gap> gq:=MinimalGeneratingSet(QHK)[1];
f1
gap> C:=CyclotomicClasses(Size(F),Index(H,K))[2];
[ 1 ]
gap> e:=PrimitiveIdempotentsNilpotent(FG,H,K,C,[epi,gq]);   
[ (Z(3)^0)*<identity> of ...+(Z(3))*f3+(Z(3)^0)*f1*f2+(Z(3))*f1*f2*f3, 
  (Z(3)^0)*<identity> of ...+(Z(3))*f3+(Z(3))*f1*f2+(Z(3)^0)*f1*f2*f3 ]
gap> FGe := LeftIdealByGenerators(FG,[e[1]]);;
gap> V := VectorSpace(F,CodeByLeftIdeal(F,G,S,FGe));;
gap> B := Basis(V);;
gap> LoadPackage("guava");;
gap> code := GeneratorMatCode(B,F);
a linear [8,2,1..4]4..5 code defined by generator matrix over GF(3)
gap> MinimumDistance(code);
4

