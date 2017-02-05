##############################################################################
##
#W  hap.gd                     GAP4 package `XMod'               Chris Wensley
#W                                                                
##
#Y  Copyright (C) 2001-2016, Chris Wensley et al,  
#Y  School of Computer Science, Bangor University, U.K. 

##############################################################################
##
#O  HapToXMod( <C> )
##  
DeclareOperation( "HapToXMod", [ IsHapCatOneGroupRep ] );

##############################################################################
##
#A  Cat1HapVersion( <cat1> )
#A  CatOneGroupXModVersion( <cat1> ) 
##
DeclareAttribute( "Cat1HapVersion", IsCat1 ); 
DeclareAttribute( "CatOneGroupXModVersion", IsHapCatOneGroup ); 

## the above does not work because IsHapOneCatOneGroup does not have 
## IsAttributeStoringRep


#############################################################################
##
#E  hap.gd  . . . . . . . . . . . . . . . . . . . . . . . . . . . . ends here
