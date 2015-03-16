# ProjTensorInduced:
# Usage: ReadPackage("recog","tst/ProjTensorInduced.g");
LoadPackage("recog");
ReadPackage("recog","tst/products.g");
g1 := GL(3,5);
g := TensorProductOfMatrixGroup(g1,g1);
h := TensorProductOfMatrixGroup(g,g1);
l := Cartesian([1..3],[1..3],[1..3]);
ll := List(l,t->Permuted(t,(1,2,3)));                   
lll := List(ll,x->Position(l,x));
p := PermList(lll);
m := PermutationMat(p,27,GF(5));
gens := ShallowCopy(GeneratorsOfGroup(h));
Add(gens,m);
ll := List(l,t->Permuted(t,(1,2)));
lll := List(ll,x->Position(l,x));
p := PermList(lll);
m := PermutationMat(p,27,GF(5));
Add(gens,m);
k := GroupWithGenerators(gens);
Print("Testing ProjTensorInduced:\n");
ri := RECOG.TestGroup(k,true,Size(PGL(3,5))^3*6);
Print("\n");
