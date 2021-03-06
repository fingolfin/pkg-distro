################################################################################
##
##  simpcomp / morse.gi
##
##  Polyhedral Morse functions 
##
##  $Id$
##
################################################################################
################################################################################
##<#GAPDoc Label="SCMorseMultiplicityVector">
## <ManSection>
## <Meth Name="SCMorseMultiplicityVector" Arg="c, f"/>
## <Returns> a list of <M>(d+1)</M>-tuples if <C>c</C> is a 
## <M>d</M>-dimensional simplicial complex upon success, <K>fail</K> 
## otherwise.</Returns>
## <Description>
## Computes all multiplicity vectors of a rsl-function <C>f</C> on a simplicial
## complex <C>c</C>. <C>f</C> is given as an ordered list 
## <M>(v_1 , \ldots v_n)</M> of all vertices  of <C>c</C> where <C>f</C> is 
## defined by <C>f</C><M>(v_i) = \frac{i-1}{n-1}</M>. The <M>i</M>-th entry 
## of the returned list denotes the multiplicity vector of vertex <M>v_i</M>.
## <Example>
## gap&gt; SCLib.SearchByName("K3");      
## [ [ 7648, "K3_16" ], [ 7649, "K3_17" ] ]
## gap&gt; c:=SCLib.Load(last[1][1]);;    
## gap&gt; f:=SCVertices(c);              
## [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16 ]
## gap&gt; SCMorseMultiplicityVector(c,f);
## [ [ 1, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0 ], [ 0, 0, 1, 0, 0 ], 
##   [ 0, 0, 2, 0, 0 ], [ 0, 0, 1, 0, 0 ], [ 0, 0, 4, 0, 0 ], [ 0, 0, 3, 0, 0 ], 
##   [ 0, 0, 3, 0, 0 ], [ 0, 0, 4, 0, 0 ], [ 0, 0, 1, 0, 0 ], [ 0, 0, 2, 0, 0 ], 
##   [ 0, 0, 1, 0, 0 ], [ 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 1 ] ]
## </Example>
## </Description>
## </ManSection>
##<#/GAPDoc>
################################################################################
################################################################################
##<#GAPDoc Label="SCMorseNumberOfCriticalPoints">
## <ManSection>
## <Meth Name="SCMorseNumberOfCriticalPoints" Arg="c, f"/>
## <Returns> an integer and a list upon success, <K>fail</K> otherwise.</Returns>
## <Description>
## Computes the number of critical points of each index of a rsl-function 
## <C>f</C> on a simplicial complex <C>c</C> as well as the total number of 
## critical points.
## <Example>
## gap&gt; SCLib.SearchByName("K3");      
## [ [ 7648, "K3_16" ], [ 7649, "K3_17" ] ]
## gap&gt; c:=SCLib.Load(last[1][1]);;    
## gap&gt; f:=SCVertices(c);              
## [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16 ]
## gap&gt; SCMorseNumberOfCriticalPoints(c,f);
## [ 24, [ 1, 0, 22, 0, 1 ] ]
## </Example>
## </Description>
## </ManSection>
##<#/GAPDoc>
################################################################################
################################################################################
##<#GAPDoc Label="SCMorseIsPerfect">
## <ManSection>
## <Meth Name="SCMorseIsPerfect" Arg="c, f"/>
## <Returns> <K>true</K> or <K>false</K> upon success, <K>fail</K> otherwise.
## </Returns>
## <Description>
## Checks whether the rsl-function <C>f</C> is perfect on the simplicial 
## complex <C>c</C> or not. A rsl-function is said to be perfect, if it has 
## the minimum number of critical points, i. e. if the sum of its critical 
## points equals the sum of the Betti numbers of <C>c</C>.
## <Example>
## gap&gt; c:=SCBdCyclicPolytope(4,6);;
## gap&gt; SCMinimalNonFaces(c);
## [ [  ], [  ], [ [ 1, 3, 5 ], [ 2, 4, 6 ] ] ]
## gap&gt; SCMorseIsPerfect(c,[1..6]);
## true
## gap&gt; SCMorseIsPerfect(c,[1,3,5,2,4,6]);   
## false
## </Example>
## </Description>
## </ManSection>
##<#/GAPDoc>
################################################################################
################################################################################
##<#GAPDoc Label="SCSlicing">
## <ManSection>
## <Meth Name="SCSlicing" Arg="complex, slicing"/>
## <Returns> a facet list of a polyhedral complex or a <C>SCNormalSurface</C> 
## object upon success, <K>fail</K> otherwise.</Returns>
## <Description>
## Returns the pre-image <M>f^{-1} (\alpha )</M> of a rsl-function <M>f</M> on 
## the simplicial complex <Arg>complex</Arg> where <M>f</M> is given in the 
## second argument <Arg>slicing</Arg> by a partition of the set of vertices 
## <Arg>slicing</Arg><M>=[ V_1 , V_2 ]</M> such that <M>f(v_1)</M> 
## (<M>f(v_2)</M>) is smaller (greater) than <M>\alpha</M> for all <M>v_1 
## \in V_1</M> (<M>v_2 \in V_2</M>).<P/>
##
## If <Arg>complex</Arg> is of dimension <M>3</M>, a &GAP; object of type 
## <C>SCNormalSurface</C> is returned. Otherwise only the facet list is 
## returned. See also <Ref Meth="SCNSSlicing"/>.<P/>
##
## The vertex labels of the returned slicing are of the form 
## <M>(v_1 , v_2)</M> where <M>v_1 \in V_1</M> and <M>v_2 \in V_2</M>. They 
## represent the center points of the edges <M>\rangle v_1 , v_2 \langle </M> 
## defined by the intersection of <Arg>slicing</Arg> with <Arg>complex</Arg>.
## <Example>
## gap&gt; c:=SCBdCyclicPolytope(4,6);;
## gap&gt; v:=SCVertices(c);
## [ 1, 2, 3, 4, 5, 6 ]
## gap&gt; SCMinimalNonFaces(c);
## [ [  ], [  ], [ [ 1, 3, 5 ], [ 2, 4, 6 ] ] ]
## gap&gt; ns:=SCSlicing(c,[v{[1,3,5]},v{[2,4,6]}]);     
## [NormalSurface
## 
##  Properties known: ConnectedComponents, Dim, EulerCharacteristic, FVector, Fac\
## etsEx, Genus, IsConnected, IsOrientable, NSTriangulation, Name, TopologicalTyp\
## e, Vertices.
## 
##  Name="slicing [ [ 1, 3, 5 ], [ 2, 4, 6 ] ] of Bd(C_4(6))"
##  Dim=2
##  FVector=[ 9, 18, 0, 9 ]
##  EulerCharacteristic=0
##  IsOrientable=true
##  TopologicalType="T^2"
## 
## /NormalSurface]
## </Example>
## <Example>
## gap&gt; c:=SCBdSimplex(5);;
## gap&gt; v:=SCVertices(c);
## [ 1, 2, 3, 4, 5, 6 ]
## gap&gt; slicing:=SCSlicing(c,[v{[1,3,5]},v{[2,4,6]}]);
## [ [ [ 1, 2 ], [ 1, 4 ], [ 3, 2 ], [ 3, 4 ], [ 5, 2 ], [ 5, 4 ] ], 
##   [ [ 1, 2 ], [ 1, 4 ], [ 1, 6 ], [ 3, 2 ], [ 3, 4 ], [ 3, 6 ] ], 
##   [ [ 1, 2 ], [ 1, 6 ], [ 3, 2 ], [ 3, 6 ], [ 5, 2 ], [ 5, 6 ] ], 
##   [ [ 1, 2 ], [ 1, 4 ], [ 1, 6 ], [ 5, 2 ], [ 5, 4 ], [ 5, 6 ] ], 
##   [ [ 1, 4 ], [ 1, 6 ], [ 3, 4 ], [ 3, 6 ], [ 5, 4 ], [ 5, 6 ] ], 
##   [ [ 3, 2 ], [ 3, 4 ], [ 3, 6 ], [ 5, 2 ], [ 5, 4 ], [ 5, 6 ] ] ]
## </Example>
## </Description>
## </ManSection>
##<#/GAPDoc>
################################################################################
################################################################################
##<#GAPDoc Label="SCIsTight">
## <ManSection>
## <Meth Name="SCIsTight" Arg="complex"/>
## <Returns> <K>true</K> or <K>false</K> upon success, <K>fail</K> otherwise.
## </Returns>
## <Description>
##
## Checks whether a simplicial complex <C>complex</C> (<C>complex</C> must
## satisfy the weak pseudomanifold property and must be closed) is a tight 
## triangulation 
## (with respect to the field with two elements) or not. A simplicial complex 
## with <M>n</M> vertices is said to be a tight 
## triangulation if it can be tightly embedded into the <M>(n-1)</M>-simplex. 
## See Section <Ref Chap="sec:tight" /> for a short introduction to the field 
## of tightness.<P/>
##
## First, if <C>complex</C> is a <M>(k+1)</M>-neighborly <M>2k</M>-manifold 
## (cf.  <Cite Key="Kuehnel95TightPolySubm" />, Corollary 4.7), or  
## <C>complex</C> is of dimension <M>d\geq 4</M>, <M>2</M>-neighborly and all 
## its vertex links are stacked spheres (i.e. the complex is in Walkup's class 
## <M>K(d)</M>, see <Cite Key="Effenberger09StackPolyTightTrigMnf" />)
## <K>true</K> is returned as the complex is a tight triangulation in these 
## cases. If <C>complex</C> is of dimension <M>d = 3</M>, <K>true</K> is 
## returned if and only if <C>complex</C> is <M>2</M>-neighborly and stacked 
## (i.e. tight-neighbourly, see <Cite Key="BDSSSepIndex" />), otherwise 
## <K>false</K> is returned, see <Cite Key="Bagchi16Tight3Mflds" />.<P/>
##
## Note that, for dimension <M>d \geq 4</M>, it is not computed whether or not 
## <C>complex</C> is a 
## combinatorial manifold as this computation might take a long time. Hence, 
## only if the manifold flag of the complex is set (this can be achieved by 
## calling <Ref Meth="SCIsManifold" /> and the complex indeed is a 
## combinatorial manifold) these checks are performed.<P/>
##
## In a second step, the algorithm first checks certain rsl-functions allowing 
## slicings between minimal non faces and the rest of the complex. In most 
## cases where <C>complex</C> is not tight at least one of these rsl-functions 
## is not perfect and thus <C>false</C> is returned as the complex is not a 
## tight triangulation.<P/>
## 
## If the complex passed all checks so far, the remaining rsl-functions are 
## checked for being perfect functions. As there are ``only'' <M>2^n</M> 
## different multiplicity vectors, but <M>n!</M> different rsl-functions, a 
## lookup table containing all possible multiplicity vectors is computed first. 
## Note that nonetheless the complexity of this algorithm is <M>O(n!)</M>.<P/>
##
## In order to reduce the number of rsl-functions that need to be checked, the 
## automorphism group of <C>complex</C> is computed first using 
## <Ref Meth="SCAutomorphismGroup" />. In case it is <M>k</M>-transitive, the 
## complexity is reduced by the factor of <M>n \cdot (n-1) \cdot \dots \cdot 
## (n-k+1)</M>.
## <Example>
## gap&gt; list:=SCLib.SearchByName("S^2~S^1 (VT)"){[1..9]};
## [ [ 12, "S^2~S^1 (VT)" ], [ 27, "S^2~S^1 (VT)" ], [ 28, "S^2~S^1 (VT)" ], 
##   [ 43, "S^2~S^1 (VT)" ], [ 47, "S^2~S^1 (VT)" ], [ 49, "S^2~S^1 (VT)" ], 
##   [ 89, "S^2~S^1 (VT)" ], [ 90, "S^2~S^1 (VT)" ], [ 111, "S^2~S^1 (VT)" ] ]
## gap&gt; s2s1:=SCLib.Load(list[1][1]);
## [SimplicialComplex
## 
##  Properties known: AltshulerSteinberg, AutomorphismGroup, 
##                    AutomorphismGroupSize, AutomorphismGroupStructure, 
##                    AutomorphismGroupTransitivity, ConnectedComponents, 
##                    Dim, DualGraph, EulerCharacteristic, FVector, 
##                    FacetsEx, GVector, GeneratorsEx, HVector, 
##                    HasBoundary, HasInterior, Homology, Interior, 
##                    IsCentrallySymmetric, IsConnected, 
##                    IsEulerianManifold, IsManifold, IsOrientable, 
##                    IsPseudoManifold, IsPure, IsStronglyConnected, 
##                    MinimalNonFacesEx, Name, Neighborliness, 
##                    NumFaces[], Orientation, Reference, SkelExs[], 
##                    Vertices.
## 
##  Name="S^2~S^1 (VT)"
##  Dim=3
##  AltshulerSteinberg=250838208
##  AutomorphismGroupSize=18
##  AutomorphismGroupStructure="D18"
##  AutomorphismGroupTransitivity=1
##  EulerCharacteristic=0
##  FVector=[ 9, 36, 54, 27 ]
##  GVector=[ 4, 10 ]
##  HVector=[ 5, 15, 5, 1 ]
##  HasBoundary=false
##  HasInterior=true
##  Homology=[ [ 0, [ ] ], [ 1, [ ] ], [ 0, [ 2 ] ], [ 0, [ ] ] ]
##  IsCentrallySymmetric=false
##  IsConnected=true
##  IsEulerianManifold=true
##  IsOrientable=false
##  IsPseudoManifold=true
##  IsPure=true
##  IsStronglyConnected=true
##  Neighborliness=2
## 
## /SimplicialComplex]
## gap&gt; SCInfoLevel(2); # print information while running
## true
## gap&gt; SCIsTight(s2s1); time;
## #I  SCIsTight: complex is 3-dimensional and tight neighbourly, and thus tight.
## true
## 4
## </Example> 
## <Example>
## gap&gt; SCLib.SearchByAttribute("F[1] = 120");
## [ [ 7647, "Bd(600-cell)" ] ]
## gap&gt; id:=last[1][1];;
## gap&gt; c:=SCLib.Load(id);;
## gap&gt; SCIsTight(c); time;
## #I  SCIsTight: complex is connected but not 2-neighbourly, and thus not tight.
## false
## 8
## </Example>
## <Example>
## gap&gt; SCInfoLevel(0);
## true
## gap&gt; SCLib.SearchByName("K3");  
## [ [ 7648, "K3_16" ], [ 7649, "K3_17" ] ]
## gap&gt; c:=SCLib.Load(last[1][1]);;
## gap&gt; SCIsManifold(c);
## true
## gap&gt; SCInfoLevel(1);
## true
## gap&gt; c.IsTight;                 
## #I  SCIsTight: complex is (k+1)-neighborly 2k-manifold and thus tight.
## true
## </Example>
## <Example>
## gap&gt; SCInfoLevel(1);
## true
## gap&gt; dc:=[ [ 1, 1, 1, 1, 45 ], [ 1, 2, 1, 27, 18 ], [ 1, 27, 9, 9, 3 ], 
## > [ 4, 7, 20, 9, 9 ], [ 9, 9, 11, 9, 11 ], [ 6, 9, 9, 17, 8 ], 
## > [ 6, 10, 8, 17, 8 ], [ 8, 8, 8, 8, 17 ], [ 5, 6, 9, 9, 20 ] ];;
## gap&gt; c:=SCBoundary(SCFromDifferenceCycles(dc));;
## gap&gt; SCAutomorphismGroup(c);;
## gap&gt; SCIsTight(c);
## #I SCIsTight: complex is 3-dimensional and tight neighbourly, and thus tight.
## true
## </Example>
## <Example>
## gap&gt; list:=SCLib.SearchByName("S^3xS^1");
## [ [ 55, "S^3xS^1 (VT)" ], [ 128, "S^3xS^1 (VT)" ], [ 399, "S^3xS^1 (VT)" ], 
##   [ 459, "S^3xS^1 (VT)" ], [ 460, "S^3xS^1 (VT)" ], [ 461, "S^3xS^1 (VT)" ], 
##   [ 462, "S^3xS^1 (VT)" ], [ 588, "S^3xS^1 (VT)" ], [ 612, "S^3xS^1 (VT)" ], 
##   [ 699, "S^3xS^1 (VT)" ], [ 700, "S^3xS^1 (VT)" ], [ 701, "S^3xS^1 (VT)" ], 
##   [ 703, "S^3xS^1 (VT)" ], [ 1078, "S^3xS^1 (VT)" ], [ 1080, "S^3xS^1 (VT)" ],
##   [ 1081, "S^3xS^1 (VT)" ], [ 1082, "S^3xS^1 (VT)" ], 
##   [ 1083, "S^3xS^1 (VT)" ], [ 1084, "S^3xS^1 (VT)" ], 
##   [ 1085, "S^3xS^1 (VT)" ], [ 1086, "S^3xS^1 (VT)" ], 
##   [ 1087, "S^3xS^1 (VT)" ], [ 1088, "S^3xS^1 (VT)" ], 
##   [ 1089, "S^3xS^1 (VT)" ], [ 1091, "S^3xS^1 (VT)" ], 
##   [ 2413, "S^3xS^1 (VT)" ], [ 2470, "S^3xS^1 (VT)" ], 
##   [ 2471, "S^3xS^1 (VT)" ], [ 2472, "S^3xS^1 (VT)" ], 
##   [ 2473, "S^3xS^1 (VT)" ], [ 2474, "S^3xS^1 (VT)" ], 
##   [ 2475, "S^3xS^1 (VT)" ], [ 2476, "S^3xS^1 (VT)" ], 
##   [ 3413, "S^3xS^1 (VT)" ], [ 3414, "S^3xS^1 (VT)" ], 
##   [ 3415, "S^3xS^1 (VT)" ], [ 3416, "S^3xS^1 (VT)" ], 
##   [ 3417, "S^3xS^1 (VT)" ], [ 3418, "S^3xS^1 (VT)" ], 
##   [ 3419, "S^3xS^1 (VT)" ], [ 3420, "S^3xS^1 (VT)" ], 
##   [ 3421, "S^3xS^1 (VT)" ], [ 3422, "S^3xS^1 (VT)" ], 
##   [ 3423, "S^3xS^1 (VT)" ], [ 3424, "S^3xS^1 (VT)" ], 
##   [ 3425, "S^3xS^1 (VT)" ], [ 3426, "S^3xS^1 (VT)" ], 
##   [ 3427, "S^3xS^1 (VT)" ], [ 3428, "S^3xS^1 (VT)" ], 
##   [ 3429, "S^3xS^1 (VT)" ], [ 3430, "S^3xS^1 (VT)" ], 
##   [ 3431, "S^3xS^1 (VT)" ], [ 3432, "S^3xS^1 (VT)" ], 
##   [ 3433, "S^3xS^1 (VT)" ], [ 3434, "S^3xS^1 (VT)" ] ]
## gap&gt; c:=SCLib.Load(list[1][1]);           
## [SimplicialComplex
## 
##  Properties known: AltshulerSteinberg, AutomorphismGroup, 
##                    AutomorphismGroupSize, AutomorphismGroupStructure, 
##                    AutomorphismGroupTransitivity, ConnectedComponents, 
##                    Dim, DualGraph, EulerCharacteristic, FVector, 
##                    FacetsEx, GVector, GeneratorsEx, HVector, 
##                    HasBoundary, HasInterior, Homology, Interior, 
##                    IsCentrallySymmetric, IsConnected, 
##                    IsEulerianManifold, IsManifold, IsOrientable, 
##                    IsPseudoManifold, IsPure, IsStronglyConnected, 
##                    MinimalNonFacesEx, Name, Neighborliness, 
##                    NumFaces[], Orientation, Reference, SkelExs[], 
##                    Vertices.
## 
##  Name="S^3xS^1 (VT)"
##  Dim=4
##  AltshulerSteinberg=737125273600
##  AutomorphismGroupSize=22
##  AutomorphismGroupStructure="D22"
##  AutomorphismGroupTransitivity=1
##  EulerCharacteristic=0
##  FVector=[ 11, 55, 110, 110, 44 ]
##  GVector=[ 5, 15, -20 ]
##  HVector=[ 6, 21, 1, 16, -1 ]
##  HasBoundary=false
##  HasInterior=true
##  Homology=[ [ 0, [ ] ], [ 1, [ ] ], [ 0, [ ] ], [ 1, [ ] ], [ 1, [ ] ] ]
##  IsCentrallySymmetric=false
##  IsConnected=true
##  IsEulerianManifold=true
##  IsOrientable=true
##  IsPseudoManifold=true
##  IsPure=true
##  IsStronglyConnected=true
##  Neighborliness=2
## 
## /SimplicialComplex]
## gap&gt; SCInfoLevel(0);
## true
## gap&gt; SCIsManifold(c);
## true
## gap&gt; SCInfoLevel(2); 
## true
## gap&gt; c.IsTight;                
## #I  SCIsInKd: complex has transitive automorphism group, only checking one link.
## #I  SCIsInKd: checking link 1/1
## #I  SCIsKStackedSphere: checking if complex is a 1-stacked sphere...
## #I  SCIsKStackedSphere: try 1/50
## #I  round 0
## Reduced complex, F: [ 9, 26, 34, 17 ]
## #I  round 1
## Reduced complex, F: [ 8, 22, 28, 14 ]
## #I  round 2
## Reduced complex, F: [ 7, 18, 22, 11 ]
## #I  round 3
## Reduced complex, F: [ 6, 14, 16, 8 ]
## #I  round 4
## Reduced complex, F: [ 5, 10, 10, 5 ]
## #I  SCReduceComplexEx: computed locally minimal complex after 5 rounds.
## #I  SCIsKStackedSphere: complex is a 1-stacked sphere.
## #I  SCIsInKd: complex has transitive automorphism group, all links are 1-stacked.
## #I  SCIsTight: complex is in class K(1) and 2-neighborly, thus tight.
## true
## </Example>
## </Description>
## </ManSection>
##<#/GAPDoc>
################################################################################
