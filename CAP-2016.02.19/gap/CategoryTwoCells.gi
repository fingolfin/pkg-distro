#############################################################################
##
##                                               CAP package
##
##  Copyright 2014, Sebastian Gutsche, TU Kaiserslautern
##                  Sebastian Posur,   RWTH Aachen
##
#############################################################################

DeclareRepresentation( "IsCapCategoryTwoCellRep",
                       IsAttributeStoringRep and IsCapCategoryTwoCell,
                       [ ] );

BindGlobal( "TheFamilyOfCapCategoryTwoCells",
        NewFamily( "TheFamilyOfCapCategoryTwoCells" ) );

BindGlobal( "TheTypeOfCapCategoryTwoCells",
        NewType( TheFamilyOfCapCategoryTwoCells,
                IsCapCategoryTwoCellRep ) );

####################################
##
## Add function
##
####################################

##
InstallMethod( Add,
               [ IsCapCategory, IsCapCategoryTwoCell ],
               
  function( category, twocell )
    local obj_filter, filter;
    
    if HasCapCategory( twocell ) then
        
        if IsIdenticalObj( CapCategory( twocell ), category ) then
            
            return;
            
        else
            
            Error( "this 2-cell already has a category" );
            
        fi;
        
    fi;
    
    AddMorphism( category, Source( twocell ) );
    
    AddMorphism( category, Range( twocell ) );
    
    filter := TwoCellFilter( category );
    
    SetFilterObj( twocell, filter );
    
    SetCapCategory( twocell, category );
    
end );

##
InstallMethod( AddTwoCell,
               [ IsCapCategory, IsObject ],
               
  function( category, twocell )
    
    SetFilterObj( twocell, IsCapCategoryTwoCell );
    
    Add( category, twocell );
    
end );

###########################
##
## IsWellDefined
##
###########################

##
InstallMethod( IsWellDefinedForTwoCells,
               [ IsCapCategoryTwoCell ],
               
  IsWellDefined
);

