##############################################################################
##
#W  example2.g                   Kan Package                     Chris Wensley
#W                                                             & Anne Heyworth
#Y  Copyright (C) 1996-2015, Chris Wensley and Anne Heyworth 
##

SetInfoLevel( InfoKan, 1 );
SetInfoLevel( InfoKnuthBendix, 1 );

Print( "\n===============================================================\n" );
Print( "2-generator example example2.g, trefoil group, version 28/06/15\n" );
Print( "===============================================================\n\n" );

FT := FreeGroup( 2 );;
relsT := [ FT.1^3*FT.2^-2 ];;
T := FT/relsT;;
genT := GeneratorsOfGroup( T );;
x := genT[1];;  y := genT[2];;
alphT := "XxYy";;
ordT := [4,3,2,1];;
orderT := "wreath";;
rwsT := ReducedConfluentRewritingSystem( T, ordT, orderT, 0, alphT );;
Print( "rules for reduced rws for trefoil group with wreath order:\n" );
DisplayRwsRules( rwsT );;
accT := WordAcceptorOfReducedRws( rwsT );
Print( "word acceptor for this rws:\n", accT, "\n" );
langT := FAtoRatExp( accT ); 
Print( "langT = ", langT, "\n" ); 
Print( "accT recognises string X ? ", IsRecognizedByAutomaton(accT,"X"), "\n" );
Print( "accT recognises string yyxyxyxYY ? ", 
        IsRecognizedByAutomaton(accT,"yxyxyxYY"), "\n" );

## find a shorter expression for langT 
alph := AlphabetOfRatExpAsList( langT );; 
a1 := RatExpOnnLetters( alph, [ ], [1] );;   ## y
a2 := RatExpOnnLetters( alph, [ ], [2] );;   ## Y
a3 := RatExpOnnLetters( alph, [ ], [3] );;   ## x
a4 := RatExpOnnLetters( alph, [ ], [4] );;   ## X
s1 := RatExpOnnLetters( alph, "star", a1 );; ## y*
s2 := RatExpOnnLetters( alph, "star", a2 );; ## Y*
a1a3 := RatExpOnnLetters( alph, "product", [ a1, a3 ] );;  ## yx 
u1 := RatExpOnnLetters( alph, "union", [ a1a3, a3 ] );;    ## yxUx
a3a1 := RatExpOnnLetters( alph, "product", [ a3, a1 ] );;  ## xy
u2 := RatExpOnnLetters( alph, "union", [ a3a1, a1 ] );;    ## xyUy
u2a3 := RatExpOnnLetters( alph, "product", [ u2, a3 ] );;  ## (xyUy)x
su2a3 := RatExpOnnLetters( alph, "star", u2a3 );;          ## ((xyUy)x)*
u2s1 := RatExpOnnLetters( alph, "product", [ u2, s1 ] );;  ## (xyUy)y*
a3s2 := RatExpOnnLetters( alph, "product", [ a3, s2 ] );;  ## xY*
u3 := RatExpOnnLetters( alph, "union", [u2s1,a3s2,s2] );; 
prod := RatExpOnnLetters( alph, "product", [u1,su2a3,u3] );;  
a1s1 := RatExpOnnLetters( alph, "product", [ a1, s1 ] );;  ## yy*
r := RatExpOnnLetters( alph, "union", [ prod, a1s1, s2] );
Print( "expression r = ", r, "\n" ); 
Print( "LangT and r are equal languages? ", AreEqualLang(langT,r), "\n\n" ); 

## find a partial dcrws with a maximum of 20 rules
prwsT :=  PartialDoubleCosetRewritingSystem( T, [x], [y], rwsT, 20 );;
Print("\nrules for partial double coset rws:\n" );
DisplayRwsRules( prwsT );

paccT := WordAcceptorOfPartialDoubleCosetRws( T, prwsT );
Print( "word acceptor for this partial double coset rws:\n", paccT, "\n" );

plangT := FAtoRatExp( paccT );
wordsT := [ "HK", "HxK", "HyK", "HYK", "HyxK", "HyxxK", "HyyH", "HyxYK"];;
Print( "list of 8 words:\n", wordsT, "\n" );
validT := List( wordsT, w -> IsRecognizedByAutomaton( paccT, w ) );
Print( "these words are or are not recognized?\n", validT, "\n\n" );
