#############################################################################
##
#W  memory.gi                                       Memory management [loops]
##  
#H  @(#)$Id: memory.gi, v 3.3.0 2016/10/20 gap Exp $
##  
#Y  Copyright (C)  2004,  G. P. Nagy (University of Szeged, Hungary),  
#Y                        P. Vojtechovsky (University of Denver, USA)
##

#############################################################################
##
#F  LOOPS_FreeMemory( )
##
##  Frees memory by unbinding some global variables, mostly those
##  declared during activation of libraries.
##  Returns the amount of freed memory in kbytes.

InstallGlobalFunction( LOOPS_FreeMemory, function( )
    # RCC loops
    LOOPS_rcc_transitive_groups := [];
    LOOPS_rcc_sections :=  List( [1..Length(LOOPS_rcc_data[1])], i-> [] );
    LOOPS_rcc_conjugacy_classes := [ [], [] ];
    # automorphic loops
    LOOPS_automorphic_cocycles := [];
    LOOPS_automorphic_coordinates := [];
    GASMAN("collect");
    return GasmanStatistics().full.deadkb;
end);


