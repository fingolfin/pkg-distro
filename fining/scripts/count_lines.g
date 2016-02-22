ReadLineWithoutHash := function(stream)
	local r;
	r := ReadLine(stream);
	if r = fail then
		return r;
	fi;
	while r <> fail do
		r := ReadLine(stream);
		if r = fail then
			return r;
		fi;
		r := NormalizedWhitespace(r);
		if Length(r) = 0 then
			return r;
		fi;
		if r[1] = '#' then
			r := ReadLine(stream);
		else
			return r;
		fi;
	od;
end;

files := ["geometry.gd", "liegeometry.gd", "group.gd", "projectivespace.gd", "correlations.gd",
		"polarspace.gd", "morphisms.gd", "enumerators.gd", "diagram.gd", "varieties.gd", "affinespace.gd",
		"affinegroup.gd", "gpolygons.gd" ];

homedir := DirectoryCurrent();
workingdir := DirectoriesPackageLibrary("fining","gap")[1]; 
outputdir := DirectoriesPackageLibrary("fining","doc/output")[1]; 
SizeScreen([256,24]);

outputfile := Filename(outputdir,"code_without_hashes.txt");

for file in files do
    filen := Filename(workingdir,file);
	stream := InputTextFile(filen);

od;



files := ["geometry.gi", "liegeometry.gi", "group.gi", "projectivespace.gi", "correlations.gi", 
		"polarspace.gi", "morphisms.gi", "enumerators.gi", "diagram.gi", "varieties.gi", "affinespace.gi",
		"affinegroup.gi", "gpolygons.gi", "orbits-stabilisers.gi" ];
