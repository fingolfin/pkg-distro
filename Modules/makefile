all: doc test

doc: doc/manual.six

doc/manual.six: makedoc.g maketest.g ListOfDocFiles.g \
		PackageInfo.g \
		doc/Modules.bib doc/*.xml doc/*.css \
		gap/*.gd gap/*.gi examples/*.g examples/doc/*.g
	        gap makedoc.g

clean:
	(cd doc ; ./clean)

test:	doc
	gap -b maketest.g


