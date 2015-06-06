#############################################################################
##
#W  affine-def.gd           Manuel Delgado <mdelgado@fc.up.pt>
#W                          Pedro A. Garcia-Sanchez <pedro@ugr.es>
##
#Y  Copyright 2015-- Centro de Matemática da Universidade do Porto, Portugal and Universidad de Granada, Spain
#############################################################################

#############################################################################
##
#R  IsAffineSemigroupRep
##
##  The representation of an affine semigroup.
##
#############################################################################
DeclareRepresentation( "IsAffineSemigroupRep", IsAttributeStoringRep, [] );

#############################################################################
##
#C  IsAffineSemigroup
##
##  The category of affine semigroups.
##
#############################################################################
DeclareCategory( "IsAffineSemigroup", IsAdditiveMagma and IsAffineSemigroupRep) ;

# Elements of affine semigroups are collections of integers, so affine
# semigroups are collections of collections of integers.
BindGlobal( "AffineSemigroupsType",
        NewType( CollectionsFamily(CollectionsFamily(CyclotomicsFamily)),
                 IsAffineSemigroup));


#############################################################################
##
#F  AffineSemigroupByGenerators(arg)
##
##  Returns the affine semigroup generated by arg.
##
#############################################################################
DeclareGlobalFunction( "AffineSemigroupByGenerators" );
#A
DeclareAttribute( "GeneratorsAS", IsAffineSemigroup);
DeclareSynonymAttr( "IsAffineSemigroupByGenerators", HasGeneratorsAS);
#A
DeclareAttribute( "DimensionAS", IsAffineSemigroup);
DeclareSynonymAttr( "DimensionOfAffineSemigroup", DimensionAS);

#############################################################################
##
#F  AffineSemigroupByMinimalGenerators(arg)
##
##  Returns the affine semigroup minimally generated by arg.
##  If the generators given are not minimal, the minimal ones
##  are computed and used.
##
#############################################################################
DeclareGlobalFunction( "AffineSemigroupByMinimalGenerators" );
#A
DeclareAttribute( "MinimalGeneratorsAS", IsAffineSemigroup);
DeclareSynonymAttr( "IsAffineSemigroupByMinimalGenerators", HasMinimalGeneratorsAS);


#############################################################################
##
#F  AffineSemigroupByMinimalGeneratorsNC(arg)
##
##  Returns the affine semigroup minimally generated by arg.
##  No test is made about args' minimality.
##
#############################################################################
DeclareGlobalFunction( "AffineSemigroupByMinimalGeneratorsNC" );

#############################################################################
##
#O  GeneratorsOfAffineSemigroup(S)
##
##  Computes a set of generators of the affine semigroup S.
##  If a set of generators has already been computed, this
##  is the set returned.
############################################################################
DeclareOperation("GeneratorsOfAffineSemigroup",[IsAffineSemigroup]);
#A
#DeclareAttribute( "GeneratorsAS", IsAffineSemigroup);

#############################################################################
## Full ffine semigroups
#############################################################################
##
#F  AffineSemigroupByEquations(ls,md)
##
##  Returns the (full) affine semigroup defined by the system A X=0 mod md, where the rows
## of A are the elements of ls.
##
#############################################################################
DeclareGlobalFunction( "AffineSemigroupByEquations" );
#A
DeclareAttribute( "EquationsAS", IsAffineSemigroup);
DeclareSynonymAttr( "IsAffineSemigroupByEquations", HasEquationsAS);
#############################################################################
##
#F  AffineSemigroupByInequalities(ls)
##
##  Returns the (full) affine semigroup defined by the system  ls*X>=0 over the nonnegative 
## integers
##
#############################################################################
DeclareGlobalFunction( "AffineSemigroupByInequalities" );
#A
DeclareAttribute( "InequalitiesAS", IsAffineSemigroup);
DeclareSynonymAttr( "IsAffineSemigroupByInequalities", HasInequalitiesAS);


#############################################################################
##
#F  AffineSemigroup(arg)
##
##  This function's first argument may be one of:
##  "generators", "minimalgenerators", 
## : equations...
##
##  The following arguments must conform to the arguments of
##  the corresponding function defined above.
##  By default, the option "generators" is used, so,
##  gap> AffineSemigroup([1,3],[7,2],[1,5]);
##  <Affine semigroup in 3-dimensional space, with 3 generators>
##
##
#############################################################################
DeclareGlobalFunction( "AffineSemigroup" );

#############################################################################
##
#P  IsAffineSemigroupByGenerators(S)
##
##  Tests if the affine semigroup S was given by its generators.
##
#############################################################################
#DeclareProperty( "IsAffineSemigroupByGenerators", IsAffineSemigroup);


#############################################################################
##
#P  IsAffineSemigroupByMinimalGenerators(S)
##
##  Tests if the affine semigroup S was given by its minimal generators.
##
#############################################################################
#DeclareProperty( "IsAffineSemigroupByMinimalGenerators", IsAffineSemigroup);

#############################################################################
##
#P  IsAffineSemigroupByEquations(S)
##
##  Tests if the affine semigroup S was given by equations or equations have already been computed.
##
#############################################################################
#DeclareProperty( "IsAffineSemigroupByEquations", IsAffineSemigroup);

#############################################################################
##
#P  IsAffineSemigroupByInequalities(S)
##
##  Tests if the affine semigroup S was given by inequalities or inequalities have already been computed.
##
#############################################################################
#DeclareProperty( "IsAffineSemigroupByInequalities", IsAffineSemigroup);

#############################################################################
##
#P  IsFullAffineSemigroup(S)
##
##  Tests if the affine semigroup S has the property of being full.
##
#############################################################################
DeclareProperty( "IsFullAffineSemigroup", IsAffineSemigroup);

#############################################################################
##
#F AsAffineSemigroup(S)
##
## Takes a numerical semigroup as argument and returns it as affine semigroup
##
#############################################################################
DeclareGlobalFunction("AsAffineSemigroup");
  
