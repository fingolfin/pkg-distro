gap> gens:=[ [ [ -28, 3, 9 ], [ 0, -1, -6 ], [ 3, 0, 1 ] ],
>   [ [ -1, 0, 0 ], [ -9, 1, 3 ], [ -3, 0, -1 ] ],
>   [ [ 0, 0, 1 ], [ 1, 0, 9 ], [ 0, 1, 0 ] ] ];
gap> g:=Group(List(gens,x->x*One(Integers mod 89)));
<matrix group with 3 generators>
gap> ffs:=FittingFreeLiftSetup(g);;
gap> Size(Image(ffs.factorhom));
704880
gap> RelativeOrders(ffs.pcgs);
[ 11, 2, 2, 2, 89, 89 ]
gap> h:=Group(List(gens,x->x*One(Integers mod 2403)));
<matrix group with 3 generators>
gap> ffs:=FittingFreeLiftSetup(h);;
gap> Size(Image(ffs.factorhom));
704880
gap> RelativeOrders(ffs.pcgs);
[ 3, 2, 2, 11, 2, 2, 2, 89, 89, 3, 3, 3, 3, 3, 3, 3, 3, 3 ]
gap> cl:=ConjugacyClasses(g);;
gap> Collected(List(cl,Size));
[ [ 1, 1 ], [ 7920, 1 ], [ 7921, 87 ], [ 704880, 1 ], [ 712890, 87 ],
  [ 62029440, 1 ], [ 62037272, 3916 ], [ 62734320, 174 ], [ 63447210, 3741 ] ]
gap> RepresentativeAction(g,g.1,g.1^g.2);
[ [ Z(89)^21, Z(89)^60, 0*Z(89) ], [ Z(89)^22, Z(89)^54, Z(89)^80 ],
  [ Z(89)^86, Z(89)^34, Z(89)^35 ] ]
gap> g.1^last=g.1^g.2;
true
gap> m:=MaximalSubgroupClassReps(h);
[ <matrix group of size 38683802512903680 with 20 generators>,
  <matrix group of size 10550127958064640 with 20 generators>,
  <matrix group of size 29012851884677760 with 19 generators>,
  <matrix group of size 14651105610240 with 19 generators>,
  <matrix group of size 4298200279211520 with 18 generators>,
  <matrix group of size 58025703769355520 with 20 generators>,
  <matrix group of size 1289460083763456 with 20 generators>,
  <matrix group of size 29635190893440 with 20 generators>,
  <matrix group of size 28976631095808 with 20 generators> ]
gap> s:=HallViaRadical(g,[2])[1];
<matrix group of size 128 with 7 generators>
gap> n:=NormalizerViaRadical(g,s);
<matrix group of size 1408 with 7 generators>
