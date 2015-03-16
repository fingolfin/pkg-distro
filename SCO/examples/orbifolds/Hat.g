#The Hat (upper Teardrop) orbifold

M := [ [1,2,3], [1,2,4], [1,3,4] ];
G := Group( (1,2) );
iso := rec( 1 := G );
mu := [
[ [3], [1,3], [1,2,3], [1,3,4], x -> (1,2) ],
[ [3], [1,3], [1,3,4], [1,2,3], x -> (1,2) ]
];

dim := 4;
