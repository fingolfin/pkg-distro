#############################################################################
##
#W  semimat.tst
#Y  Copyright (C) 2015                                    Markus Pfeiffer
##
##  Licensing information can be found in the README file of this package.
##
#############################################################################
##
gap> START_TEST("Semigroups package: semimat.tst");
gap> LoadPackage( "semigroups", false );;

# Set info levels and user preferences
gap> SemigroupsStartTest();

#T# MatrixSemigroupTest1: Create and Size
gap> M := NewMatrixOverFiniteField(IsPlistMatrixOverFiniteFieldRep, GF(2), 16,
> [[ 0*Z(2), Z(2)^0, Z(2)^0, Z(2)^0, Z(2)^0, Z(2)^0, Z(2)^0, Z(2)^0, Z(2)^0, Z(2)^0, Z(2)^0, Z(2)^0, 0*Z(2), 0*Z(2), 0*Z(2), Z(2)^0 ],
> [ 0*Z(2), 0*Z(2), Z(2)^0, Z(2)^0, 0*Z(2), 0*Z(2), 0*Z(2), Z(2)^0, 0*Z(2), 0*Z(2), Z(2)^0, 0*Z(2), 0*Z(2), Z(2)^0, Z(2)^0, Z(2)^0 ],
> [ Z(2)^0, 0*Z(2), Z(2)^0, Z(2)^0, Z(2)^0, Z(2)^0, Z(2)^0, Z(2)^0, Z(2)^0, Z(2)^0, 0*Z(2), Z(2)^0, 0*Z(2), Z(2)^0, Z(2)^0, Z(2)^0 ],
> [ 0*Z(2), 0*Z(2), 0*Z(2), Z(2)^0, 0*Z(2), 0*Z(2), Z(2)^0, 0*Z(2), 0*Z(2), Z(2)^0, 0*Z(2), Z(2)^0, Z(2)^0, Z(2)^0, 0*Z(2), 0*Z(2) ],
> [ 0*Z(2), Z(2)^0, Z(2)^0, Z(2)^0, Z(2)^0, 0*Z(2), 0*Z(2), 0*Z(2), Z(2)^0, 0*Z(2), 0*Z(2), 0*Z(2), Z(2)^0, 0*Z(2), 0*Z(2), Z(2)^0 ],
> [ 0*Z(2), 0*Z(2), 0*Z(2), 0*Z(2), 0*Z(2), 0*Z(2), 0*Z(2), 0*Z(2), 0*Z(2), 0*Z(2), Z(2)^0, 0*Z(2), Z(2)^0, Z(2)^0, 0*Z(2), 0*Z(2) ],
> [ 0*Z(2), Z(2)^0, 0*Z(2), Z(2)^0, Z(2)^0, 0*Z(2), 0*Z(2), 0*Z(2), 0*Z(2), 0*Z(2), Z(2)^0, Z(2)^0, Z(2)^0, Z(2)^0, Z(2)^0, 0*Z(2) ],
> [ 0*Z(2), Z(2)^0, 0*Z(2), 0*Z(2), Z(2)^0, Z(2)^0, 0*Z(2), 0*Z(2), Z(2)^0, 0*Z(2), 0*Z(2), Z(2)^0, 0*Z(2), 0*Z(2), Z(2)^0, 0*Z(2) ],
> [ Z(2)^0, Z(2)^0, 0*Z(2), Z(2)^0, 0*Z(2), 0*Z(2), 0*Z(2), Z(2)^0, Z(2)^0, Z(2)^0, 0*Z(2), Z(2)^0, 0*Z(2), 0*Z(2), 0*Z(2), Z(2)^0 ],
> [ 0*Z(2), 0*Z(2), 0*Z(2), 0*Z(2), 0*Z(2), 0*Z(2), 0*Z(2), 0*Z(2), Z(2)^0, Z(2)^0, 0*Z(2), 0*Z(2), Z(2)^0, 0*Z(2), Z(2)^0, Z(2)^0 ],
> [ 0*Z(2), Z(2)^0, 0*Z(2), 0*Z(2), 0*Z(2), 0*Z(2), Z(2)^0, Z(2)^0, Z(2)^0, Z(2)^0, Z(2)^0, 0*Z(2), 0*Z(2), Z(2)^0, Z(2)^0, 0*Z(2) ],
> [ 0*Z(2), Z(2)^0, Z(2)^0, 0*Z(2), 0*Z(2), Z(2)^0, 0*Z(2), Z(2)^0, 0*Z(2), 0*Z(2), 0*Z(2), 0*Z(2), 0*Z(2), 0*Z(2), 0*Z(2), Z(2)^0 ],
> [ Z(2)^0, 0*Z(2), Z(2)^0, 0*Z(2), 0*Z(2), Z(2)^0, 0*Z(2), Z(2)^0, Z(2)^0, Z(2)^0, 0*Z(2), Z(2)^0, 0*Z(2), 0*Z(2), 0*Z(2), Z(2)^0 ],
> [ 0*Z(2), Z(2)^0, Z(2)^0, 0*Z(2), 0*Z(2), 0*Z(2), Z(2)^0, 0*Z(2), Z(2)^0, Z(2)^0, Z(2)^0, 0*Z(2), Z(2)^0, 0*Z(2), 0*Z(2), Z(2)^0 ],
> [ 0*Z(2), 0*Z(2), 0*Z(2), 0*Z(2), 0*Z(2), Z(2)^0, 0*Z(2), Z(2)^0, 0*Z(2), 0*Z(2), 0*Z(2), Z(2)^0, Z(2)^0, 0*Z(2), 0*Z(2), 0*Z(2) ],
> [ Z(2)^0, 0*Z(2), Z(2)^0, Z(2)^0, Z(2)^0, Z(2)^0, Z(2)^0, 0*Z(2), Z(2)^0, 0*Z(2), Z(2)^0, Z(2)^0, 0*Z(2), 0*Z(2), Z(2)^0, Z(2)^0 ]
> ]);;
gap> S := Semigroup(M);
<semigroup of 16x16 matrices over GF(2) with 1 generator>
gap> Size(S);
7161
gap> NrDClasses(S);
1
gap> PartialOrderOfDClasses(S);
[ [ 1 ] ]
gap> StructureDescriptionSchutzenbergerGroups(S);
[ "C7161" ]
gap> T := AsTransformationSemigroup(S);
<commutative transformation semigroup of degree 65536 with 1 generator>
gap> Size(T);
7161
gap> Size(S) = Size(T);
true
gap> NrIdempotents(S) = NrIdempotents(T);
true

#T# MatrixSemigroupTest2: Create and Size
gap> S := Semigroup(
> [ NewMatrixOverFiniteField(IsPlistMatrixOverFiniteFieldRep,GF(3),5,
> [ [ Z(3), Z(3), Z(3)^0, Z(3), Z(3)^0 ],
>   [ 0*Z(3), 0*Z(3), Z(3), 0*Z(3), Z(3)^0 ],
>   [ Z(3), Z(3), Z(3)^0, 0*Z(3), Z(3) ],
>   [ Z(3)^0, Z(3)^0, Z(3), Z(3), 0*Z(3) ],
>   [ Z(3), Z(3)^0, Z(3), Z(3)^0, 0*Z(3) ] ]),
> NewMatrixOverFiniteField(IsPlistMatrixOverFiniteFieldRep,GF(3),5,
> [ [ 0*Z(3), Z(3)^0, 0*Z(3), Z(3), Z(3) ],
>   [ Z(3), 0*Z(3), Z(3)^0, 0*Z(3), Z(3)^0 ],
>   [ Z(3), Z(3), Z(3)^0, Z(3), Z(3) ],
>   [ Z(3), Z(3), 0*Z(3), Z(3), Z(3)^0 ],
>   [ Z(3), Z(3), Z(3)^0, Z(3)^0, Z(3) ] ]) ]);;
gap> Size(S);
170080803
gap> NrIdempotents(S);
43844
gap> PartialOrderOfDClasses(S);
[ [ 1, 2 ], [ 2, 3 ], [ 3, 4 ], [ 4, 5 ], [ 5 ] ]
gap> S := Semigroup(GeneratorsOfSemigroup(S));
<semigroup of 5x5 matrices over GF(3) with 2 generators>
gap> PartialOrderOfDClasses(S);
[ [ 1, 2 ], [ 2, 3 ], [ 3, 4 ], [ 4, 5 ], [ 5 ] ]

#T# MatrixSemigroupTest3: Create, Size, MinimalIdeal
gap> S := Semigroup(
> [ NewMatrixOverFiniteField(IsPlistMatrixOverFiniteFieldRep,GF(3),3,
>    [ [ Z(3), Z(3), Z(3)^0 ],
>      [ 0*Z(3), Z(3), Z(3) ], 
>      [ Z(3), 0*Z(3), Z(3)^0 ] ]),
>   NewMatrixOverFiniteField(IsPlistMatrixOverFiniteFieldRep,GF(3),3,
>    [ [ Z(3), Z(3), 0*Z(3) ],
>      [ Z(3)^0, Z(3)^0, 0*Z(3) ], 
>      [ Z(3)^0, Z(3)^0, 0*Z(3) ] ]) ]);;
gap> Size(S);
137
gap> NrIdempotents(S);
42
gap> MinimalIdeal(S);
<ideal of semigroup of 3x3 matrices over GF(3) with 1 generator>
gap> Size(last);
1
gap> MultiplicativeZero(S);
<matrix over GF(3) of degree 3>
gap> MinimalDClass(S);
<Green's D-class: <matrix over GF(3) of degree 3>>
gap> M := MaximalSubsemigroups(S);;
gap> List(M, Size);
[ 133, 9 ]
gap> List(M, U-> IsMaximalSubsemigroup(S, U));
[ true, true ]

#T# MatrixSemigroups3: Upper triangular matrices, SubsemigroupByProperty
gap> upper := function(mat)
>   local zero, n, i, j;
>   zero := Zero(BaseDomain(mat));
>   n := DegreeOfMatrixOverFiniteField(mat);
>   for i in [2 .. n] do 
>     for j in [1 .. i - 1] do 
>       if mat!.mat[i][j] <> zero then 
>         return false;
>       fi;
>     od;
>   od;
>   return true;
> end;;
gap> S := GeneralLinearSemigroup(3,3);;
gap> T := SubsemigroupByProperty(S, upper);
<monoid of 3x3 matrices over GF(3) with 12 generators>
gap> Size(T);
729

#T# MatrixSemigroups4: ClosureSemigroup
gap> elms := Filtered(Elements(GLS(3,3)), upper);;
gap> S := Semigroup(elms[1]);;
gap> for i in [2..Length(elms)] do
>  S := ClosureSemigroup(S, elms[i]);
> od;;
gap> S;
<monoid of 3x3 matrices over GF(3) with 64 generators>
gap> Size(S);
729

#T# MatrixSemigroups5:  
gap> func := IsGreensDLeq(S);
function( x, y ) ... end
gap> x := Random(S);
<matrix over GF(3) of degree 3>
gap> y := Random(S);
<matrix over GF(3) of degree 3>
gap> func(x, y);;        
gap> func(y, x);;

#T# MatrixSemigroups6:
gap> T := Semigroup(Transformation( [ 1, 2, 7, 3, 2, 1, 4, 3 ] ), Transformation( [ 5, 7, 8, 2, 7, 3, 8, 5 ] ));
<transformation semigroup of degree 8 with 2 generators>
gap> Size(T);
416
gap> S := AsMatrixSemigroup(T);
<semigroup of 8x8 matrices over GF(2) with 2 generators>
gap> Size(S);
416
gap> Size(S) = Size(T);
true
gap> NrIdempotents(S) = NrIdempotents(T);
true

#T# MatrixSemigroups7:
gap> S := Semigroup( 
> NewMatrixOverFiniteField(IsPlistMatrixOverFiniteFieldRep, GF(2), 16, 
>    [ [ Z(2)^0, 0*Z(2), Z(2)^0, 0*Z(2), 0*Z(2), Z(2)^0, Z(2)^0, 0*Z(2), 0*Z(2), Z(2)^0, Z(2)^0, Z(2)^0, 0*Z(2), 0*Z(2), 0*Z(2), Z(2)^0 ],
>      [ Z(2)^0, 0*Z(2), 0*Z(2), 0*Z(2), 0*Z(2), Z(2)^0, 0*Z(2), Z(2)^0, Z(2)^0, 0*Z(2), Z(2)^0, 0*Z(2), 0*Z(2), 0*Z(2), Z(2)^0, 0*Z(2) ],
>      [ Z(2)^0, Z(2)^0, Z(2)^0, Z(2)^0, Z(2)^0, Z(2)^0, Z(2)^0, Z(2)^0, Z(2)^0, 0*Z(2), Z(2)^0, 0*Z(2), 0*Z(2), 0*Z(2), 0*Z(2), 0*Z(2) ], 
>      [ 0*Z(2), Z(2)^0, 0*Z(2), 0*Z(2), 0*Z(2), Z(2)^0, 0*Z(2), 0*Z(2), 0*Z(2), Z(2)^0, Z(2)^0, 0*Z(2), Z(2)^0, Z(2)^0, 0*Z(2), 0*Z(2) ],
>      [ Z(2)^0, 0*Z(2), Z(2)^0, 0*Z(2), Z(2)^0, 0*Z(2), Z(2)^0, 0*Z(2), Z(2)^0, Z(2)^0, 0*Z(2), Z(2)^0, 0*Z(2), 0*Z(2), Z(2)^0, Z(2)^0 ],
>      [ Z(2)^0, Z(2)^0, 0*Z(2), 0*Z(2), 0*Z(2), Z(2)^0, Z(2)^0, Z(2)^0, Z(2)^0, 0*Z(2), 0*Z(2), Z(2)^0, Z(2)^0, 0*Z(2), Z(2)^0, Z(2)^0 ], 
>      [ Z(2)^0, Z(2)^0, 0*Z(2), 0*Z(2), Z(2)^0, 0*Z(2), Z(2)^0, Z(2)^0, 0*Z(2), 0*Z(2), 0*Z(2), Z(2)^0, 0*Z(2), Z(2)^0, 0*Z(2), 0*Z(2) ],
>      [ Z(2)^0, Z(2)^0, 0*Z(2), 0*Z(2), Z(2)^0, Z(2)^0, 0*Z(2), Z(2)^0, 0*Z(2), Z(2)^0, Z(2)^0, 0*Z(2), Z(2)^0, Z(2)^0, 0*Z(2), 0*Z(2) ],
>      [ Z(2)^0, 0*Z(2), Z(2)^0, 0*Z(2), 0*Z(2), Z(2)^0, Z(2)^0, 0*Z(2), 0*Z(2), Z(2)^0, 0*Z(2), Z(2)^0, Z(2)^0, Z(2)^0, 0*Z(2), 0*Z(2) ], 
>      [ 0*Z(2), 0*Z(2), 0*Z(2), Z(2)^0, 0*Z(2), Z(2)^0, 0*Z(2), 0*Z(2), 0*Z(2), Z(2)^0, 0*Z(2), 0*Z(2), Z(2)^0, 0*Z(2), Z(2)^0, Z(2)^0 ],
>      [ 0*Z(2), 0*Z(2), 0*Z(2), 0*Z(2), Z(2)^0, 0*Z(2), Z(2)^0, 0*Z(2), Z(2)^0, Z(2)^0, 0*Z(2), Z(2)^0, Z(2)^0, 0*Z(2), Z(2)^0, 0*Z(2) ],
>      [ Z(2)^0, Z(2)^0, Z(2)^0, Z(2)^0, 0*Z(2), 0*Z(2), 0*Z(2), 0*Z(2), 0*Z(2), 0*Z(2), Z(2)^0, 0*Z(2), Z(2)^0, Z(2)^0, Z(2)^0, 0*Z(2) ], 
>      [ 0*Z(2), Z(2)^0, Z(2)^0, 0*Z(2), 0*Z(2), 0*Z(2), 0*Z(2), Z(2)^0, Z(2)^0, Z(2)^0, Z(2)^0, 0*Z(2), Z(2)^0, 0*Z(2), Z(2)^0, 0*Z(2) ],
>      [ Z(2)^0, 0*Z(2), 0*Z(2), 0*Z(2), 0*Z(2), Z(2)^0, Z(2)^0, 0*Z(2), Z(2)^0, 0*Z(2), 0*Z(2), 0*Z(2), Z(2)^0, Z(2)^0, Z(2)^0, 0*Z(2) ],
>      [ 0*Z(2), Z(2)^0, Z(2)^0, Z(2)^0, 0*Z(2), 0*Z(2), 0*Z(2), 0*Z(2), Z(2)^0, Z(2)^0, Z(2)^0, Z(2)^0, 0*Z(2), Z(2)^0, 0*Z(2), Z(2)^0 ], 
>      [ Z(2)^0, Z(2)^0, Z(2)^0, Z(2)^0, 0*Z(2), 0*Z(2), Z(2)^0, Z(2)^0, 0*Z(2), 0*Z(2), Z(2)^0, 0*Z(2), Z(2)^0, Z(2)^0, Z(2)^0, Z(2)^0 ] ]),
> NewMatrixOverFiniteField(IsPlistMatrixOverFiniteFieldRep, GF(2), 16, 
>    [ [ Z(2)^0, 0*Z(2), Z(2)^0, Z(2)^0, Z(2)^0, 0*Z(2), 0*Z(2), 0*Z(2), Z(2)^0, Z(2)^0, Z(2)^0, 0*Z(2), 0*Z(2), 0*Z(2), Z(2)^0, 0*Z(2) ],
>      [ 0*Z(2), Z(2)^0, 0*Z(2), 0*Z(2), Z(2)^0, Z(2)^0, 0*Z(2), 0*Z(2), 0*Z(2), Z(2)^0, Z(2)^0, Z(2)^0, Z(2)^0, Z(2)^0, Z(2)^0, Z(2)^0 ],
>      [ 0*Z(2), 0*Z(2), 0*Z(2), Z(2)^0, 0*Z(2), 0*Z(2), 0*Z(2), 0*Z(2), Z(2)^0, Z(2)^0, 0*Z(2), Z(2)^0, 0*Z(2), 0*Z(2), Z(2)^0, Z(2)^0 ], 
>      [ Z(2)^0, Z(2)^0, Z(2)^0, Z(2)^0, 0*Z(2), Z(2)^0, 0*Z(2), 0*Z(2), Z(2)^0, Z(2)^0, 0*Z(2), Z(2)^0, Z(2)^0, 0*Z(2), Z(2)^0, Z(2)^0 ],
>      [ Z(2)^0, 0*Z(2), Z(2)^0, 0*Z(2), Z(2)^0, 0*Z(2), 0*Z(2), 0*Z(2), 0*Z(2), Z(2)^0, Z(2)^0, Z(2)^0, 0*Z(2), Z(2)^0, Z(2)^0, Z(2)^0 ],
>      [ 0*Z(2), 0*Z(2), Z(2)^0, 0*Z(2), 0*Z(2), 0*Z(2), 0*Z(2), 0*Z(2), 0*Z(2), 0*Z(2), 0*Z(2), Z(2)^0, Z(2)^0, Z(2)^0, 0*Z(2), Z(2)^0 ], 
>      [ 0*Z(2), Z(2)^0, 0*Z(2), Z(2)^0, 0*Z(2), Z(2)^0, Z(2)^0, Z(2)^0, 0*Z(2), 0*Z(2), 0*Z(2), Z(2)^0, 0*Z(2), 0*Z(2), 0*Z(2), 0*Z(2) ],
>      [ Z(2)^0, 0*Z(2), 0*Z(2), 0*Z(2), Z(2)^0, Z(2)^0, Z(2)^0, Z(2)^0, 0*Z(2), 0*Z(2), Z(2)^0, Z(2)^0, 0*Z(2), 0*Z(2), Z(2)^0, Z(2)^0 ],
>      [ 0*Z(2), Z(2)^0, 0*Z(2), 0*Z(2), 0*Z(2), 0*Z(2), 0*Z(2), 0*Z(2), Z(2)^0, 0*Z(2), 0*Z(2), Z(2)^0, Z(2)^0, 0*Z(2), Z(2)^0, 0*Z(2) ], 
>      [ 0*Z(2), Z(2)^0, 0*Z(2), 0*Z(2), 0*Z(2), 0*Z(2), 0*Z(2), 0*Z(2), Z(2)^0, 0*Z(2), Z(2)^0, Z(2)^0, 0*Z(2), 0*Z(2), Z(2)^0, 0*Z(2) ],
>      [ 0*Z(2), 0*Z(2), Z(2)^0, Z(2)^0, 0*Z(2), Z(2)^0, Z(2)^0, Z(2)^0, Z(2)^0, Z(2)^0, 0*Z(2), Z(2)^0, 0*Z(2), 0*Z(2), 0*Z(2), Z(2)^0 ],
>      [ Z(2)^0, Z(2)^0, 0*Z(2), Z(2)^0, Z(2)^0, Z(2)^0, Z(2)^0, Z(2)^0, 0*Z(2), 0*Z(2), Z(2)^0, Z(2)^0, Z(2)^0, Z(2)^0, 0*Z(2), 0*Z(2) ], 
>      [ 0*Z(2), Z(2)^0, Z(2)^0, Z(2)^0, 0*Z(2), Z(2)^0, Z(2)^0, Z(2)^0, 0*Z(2), 0*Z(2), Z(2)^0, 0*Z(2), 0*Z(2), Z(2)^0, 0*Z(2), Z(2)^0 ],
>      [ 0*Z(2), 0*Z(2), 0*Z(2), 0*Z(2), Z(2)^0, Z(2)^0, 0*Z(2), 0*Z(2), Z(2)^0, Z(2)^0, Z(2)^0, 0*Z(2), 0*Z(2), Z(2)^0, 0*Z(2), Z(2)^0 ],
>      [ 0*Z(2), Z(2)^0, 0*Z(2), 0*Z(2), Z(2)^0, Z(2)^0, 0*Z(2), 0*Z(2), 0*Z(2), 0*Z(2), 0*Z(2), Z(2)^0, 0*Z(2), 0*Z(2), 0*Z(2), Z(2)^0 ], 
>      [ 0*Z(2), 0*Z(2), Z(2)^0, 0*Z(2), Z(2)^0, Z(2)^0, 0*Z(2), 0*Z(2), Z(2)^0, Z(2)^0, Z(2)^0, Z(2)^0, Z(2)^0, 0*Z(2), 0*Z(2), 0*Z(2) ] ]) );
<semigroup of 16x16 matrices over GF(2) with 2 generators>
gap> Size(S);
21392255076846796800
gap> IsGroupAsSemigroup(S);
false
gap> NrIdempotents(S);
4
gap> NrRClasses(S);
2
gap> NrLClasses(S);
2
gap> SchutzenbergerGroup(DClasses(S)[1]);
<group of 8x8 matrices over GF(2) with 3 generators>
gap> PartialOrderOfDClasses(S);
[ [ 1 ] ]

#FIXME 
#gap> StructureDescriptionOfSchutzenbergerGroups(S); 
#T This takes ages, and this is probably due to the
#T StructureDescription for matrix over finite field
#T groups not being very efficient.
#T It seems to be going through permutation groups
#T Making a Schutzenberger group into a normal GAP
#T Matrix group yields a result instantly:
gap> G := Group(List(GeneratorsOfGroup(SchutzenbergerGroup(DClasses(S)[1])), AsMatrix));
<matrix group with 3 generators>
gap> Size(G);
5348063769211699200
gap> StructureDescription(G);
"PSL(8,2)"

#T# 
gap> S := AsMatrixSemigroup(Semigroup([Z(4) * [[1,0,0], [1,1,0], [0,1,0]],
>                         Z(4) * [[0,0,0],[0,0,1],[0,1,0]]]));
<semigroup of 3x3 matrices over GF(2^2) with 2 generators>
gap> Size(S);
27

#T# SEMIGROUPS_UnbindVariables
gap> Unbind(S);
gap> Unbind(G);
gap> Unbind(func);
gap> Unbind(T);
gap> Unbind(x);
gap> Unbind(y);
gap> Unbind(upper);
gap> Unbind(M);

#E#
gap> STOP_TEST("Semigroups package: semimat.tst");
