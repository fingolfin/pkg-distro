#this is a test file
list := List(Lines(PG(4,7)));;  #27260 ms
orb := AsList(Lines(PG(4,7))); #38522 ms
list2 := List(orb);;
Set(list)=Set(list2);
quit;
