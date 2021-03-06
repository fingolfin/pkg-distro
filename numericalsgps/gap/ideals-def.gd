#############################################################################
##
#W  ideals-def.gd           Manuel Delgado <mdelgado@fc.up.pt>
#W                          Pedro A. Garcia-Sanchez <pedro@ugr.es>
#W                          Jose Morais <josejoao@fc.up.pt>
##
##
#Y  Copyright 2005 by Manuel Delgado,
#Y  Pedro Garcia-Sanchez and Jose Joao Morais
#Y  We adopt the copyright regulations of GAP as detailed in the
#Y  copyright notice in the GAP manual.
##
#############################################################################

#############################################################################
##
#R  IsIdealOfNumericalSemigroupRep
##
##  The representation of an ideal of a numerical semigroup.
##
#############################################################################
DeclareRepresentation( "IsIdealOfNumericalSemigroupRep", IsAttributeStoringRep,
        ["UnderlyingNSIdeal", "GeneratorsIdealNS"] );


#############################################################################
##
#C  IsIdealOfNumericalSemigroup
##
##  The category of ideals of numerical semigroups.
##
#############################################################################
DeclareCategory( "IsIdealOfNumericalSemigroup", IsAdditiveMagma and IsIdealOfNumericalSemigroupRep);


# Elements of ideals of numerical semigroups are integers, so ideals of
# numerical semigroups are collections of integers.
BindGlobal( "IdealsOfNumericalSemigroupsType",
        NewType( CollectionsFamily(CyclotomicsFamily),
                 IsIdealOfNumericalSemigroup));


#############################################################################
##
#F IdealOfNumericalSemigroup(l,S)
##
## l is a list of integers and S a numerical semigroup
##
## returns the ideal of S generated by l.
##
#############################################################################
DeclareGlobalFunction("IdealOfNumericalSemigroup");
#A
DeclareAttribute( "UnderlyingNSIdeal", IsNumericalSemigroup);


#############################################################################
##
#F  GeneratorsOfIdealOfNumericalSemigroup(I)
##
##  Returns a set of generators of the ideal I.
##  If a minimal generating system has already been computed, this
##  is the set returned.
############################################################################
DeclareGlobalFunction("GeneratorsOfIdealOfNumericalSemigroup");
#A
DeclareAttribute( "GeneratorsIdealNS", IsIdealOfNumericalSemigroup);


#############################################################################
##
#F  GeneratorsOfIdealOfNumericalSemigroupNC(I)
##
##  Returns a set of generators of the ideal I.
############################################################################
DeclareGlobalFunction("GeneratorsOfIdealOfNumericalSemigroupNC");



#############################################################################
##
#F AmbientNumericalSemigroupOfIdeal(I)
##
##  Returns the ambient semigroup of the ideal I.
############################################################################
DeclareGlobalFunction("AmbientNumericalSemigroupOfIdeal");



#############################################################################
##
#F SumIdealsOfNumericalSemigroup(I,J)
##
## returns the sum of the ideals I and J (in the same ambient semigroup)
#############################################################################
DeclareGlobalFunction("SumIdealsOfNumericalSemigroup");



#############################################################################
##
#F SubtractIdealsOfNumericalSemigroup(I,J)
##
## returns the ideal I - J
#############################################################################
DeclareGlobalFunction("SubtractIdealsOfNumericalSemigroup");


#############################################################################
##
#F  BelongsToIdealOfNumericalSemigroup(n,I)
##
##  Tests if the integer n belongs to the ideal I.
##
#############################################################################
DeclareGlobalFunction("BelongsToIdealOfNumericalSemigroup");



#############################################################################
##
#F DifferenceOfdealsOfNumericalSemigroup(I,J)
##
## returns the set difference I\J (J must be contained in I)
#############################################################################
DeclareGlobalFunction("DifferenceOfIdealsOfNumericalSemigroup");



#############################################################################
##
#F MultipleOfIdealOfNumericalSemigroup(n,I)
##
## n is a non negative integer and I is an ideal
## returns the multiple nI (I+...+I n times) of I
#############################################################################
DeclareGlobalFunction("MultipleOfIdealOfNumericalSemigroup");



#############################################################################
##
#F HilbertFunctionOfIdealOfNumericalSemigroup(n,I)
##
## returns the value of the Hilbert function associated to I in n,
## that is, nI\(n+1)I. I must be an ideal included in its ambient semigroup.
#############################################################################
DeclareGlobalFunction("HilbertFunctionOfIdealOfNumericalSemigroup");



#############################################################################
##
#F BlowUpIdealOfNumericalSemigroup(I)
##
##
#############################################################################
DeclareGlobalFunction("BlowUpIdealOfNumericalSemigroup");



#############################################################################
##
#A MinimalGeneratingSystem(I)
##
## The argument I is an ideal of a numerical semigroup
## returns the minimal generating system of I.
##
#############################################################################
DeclareAttribute("MinimalGeneratingSystemOfIdealOfNumericalSemigroup", IsIdealOfNumericalSemigroup);


#############################################################################
##
#A SmallElementsOfIdealOfNumericalSemigroup
##
##  Returns the list of elements in the ideal I up to the last gap + 1.
##
#############################################################################
DeclareAttribute( "SmallElementsOfIdealOfNumericalSemigroup", IsIdealOfNumericalSemigroup);



#############################################################################
##
#F  MaximalIdealOfNumericalSemigroup(S)
##
##  Returns the maximal ideal of S.
##
#############################################################################
DeclareGlobalFunction("MaximalIdealOfNumericalSemigroup");

#############################################################################
##
#F IsMonomialNumericalSemigroup
## Tests if a numerical semigroup is a monomial semigroup ring
##
#############################################################################
DeclareGlobalFunction("IsMonomialNumericalSemigroup");
        
#############################################################################
##
#F  BlowUpOfNumericalSemigroup(s)
##
##  Computes the Blow Up (of the maximal ideal) of
##  the numerical semigroup <s>.
##
#############################################################################
DeclareGlobalFunction("BlowUpOfNumericalSemigroup");


#############################################################################
##
#F  MicroInvariantsOfNumericalSemigroup(s)
##
##  Computes the microinvariants of the numerical semigroup <s>
##  using the formula given by Valentina and Ralf [BF06]. The
##  microinvariants of a numerial semigroup where introduced
##  by J. Elias in [E01].
##
#############################################################################
DeclareGlobalFunction("MicroInvariantsOfNumericalSemigroup");


#############################################################################
##
#F  IsGradedAssociatedRingNumericalSemigroupCM(s)
##
##  Returns true if the associated graded ring of
##  the semigroup ring algebra k[[s]] is Cohen-Macaulay.
##  This function implements the algorithm given in [BF06].
##
#############################################################################
DeclareGlobalFunction("IsGradedAssociatedRingNumericalSemigroupCM");


#############################################################################
##
#F  CanonicalIdealOfNumericalSemigroup(s)
##
##  Computes a canonical ideal of <s> ([B06]):
##      { x in Z | g-x not in S}
##
#############################################################################
DeclareGlobalFunction("CanonicalIdealOfNumericalSemigroup");


#############################################################################
##
#F  ReductionNumberIdealNumericalSemigroup(I)
##
##  Returns the least nonnegative integer such that
##  nI-nI=(n+1)I-(n+1)I, see [B06].
##
#############################################################################
DeclareGlobalFunction("ReductionNumberIdealNumericalSemigroup");


#############################################################################
##
#F  TranslationOfIdealOfNumericalSemigroup(k,I)
##
##  Given an ideal <I> of a numerical semigroup S and an integer <k>
##  returns an ideal of the numerical semigroup S generated by
##  {i1+k,...,in+k} where {i1,...,in} is the system of generators of <I>.
##
#############################################################################
DeclareGlobalFunction("TranslationOfIdealOfNumericalSemigroup");


#############################################################################
##
#F  IntersectionIdealsOfNumericalSemigroup(I,J)
##
##  Given two ideals <I> and <J> of a numerical semigroup S
##  returns the ideal of the numerical semigroup S which is the
##  intersection of the ideals <I> and <J>.
##
#############################################################################
DeclareGlobalFunction("IntersectionIdealsOfNumericalSemigroup");

########################################################################
##
#F AperyListOfIdealOfNumericalSemigroupWRTElement(I,n)
##
##  Computes the sets of elements x of I such that x-n not in I,
##  where n is supposed to be in the ambient semigroup of I.
##  The element in the i-th position of the output list (starting in 0) 
##  is congruent with i modulo n 
########################################################################
DeclareGlobalFunction("AperyListOfIdealOfNumericalSemigroupWRTElement");

########################################################################
##
#F AperyTableOfNumericalSemigroup(S)
##
##  Computes the Apéry table associated to S as 
## explained in [CJZ],
##  that is, a list containing the Apéry list of S with respect to 
## its multiplicity and the Apéry lists of kM (with M the maximal 
##  ideal of S) with respect to the multiplicity of S, for k=1..r,
##  where r is the reduction number of M 
##  (see ReductionNumberIdealNumericalSemigroup).
########################################################################
DeclareGlobalFunction("AperyTableOfNumericalSemigroup");

########################################################################
## 
#F StarClosureOfIdealOfNumericalSemigroup(i,is)
##  i is an ideal and is is a set of ideals (all from the same 
##	numerical semigroup). The output is i^{*_is}, where
## *_is is the star operation generated by is
## The implementation uses Section 3 of
##  -D. Spirito, Start Operations on Numerical Semigroups
########################################################################

DeclareGlobalFunction("StarClosureOfIdealOfNumericalSemigroup");
