#EGQ from a classical group
gp := ParabolicQuadric(4,3);
group := IsometryGroup(gp);
p := Random(Points(gp));
lines := List(Lines(p));
stab := FiningStabiliser(group,p);
stab2 := FiningStabiliser(stab,lines[1]);
stab3 := FiningStabiliser(stab2,lines[2]);
stab4 := FiningStabiliser(stab3,lines[3]);
stab5 := FiningStabiliser(stab4,lines[4]);
Order(stab3);
