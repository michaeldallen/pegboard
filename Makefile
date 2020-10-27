ifeq ($(shell uname -s),Darwin)
	OPENSCAD := /Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD
else ifeq (($shell uname -s),Linux)
	OPENSCAD := /usr/bin/openscad
endif


clean :
	find * -name '*~' -exec rm -v {} \;
	find * -name '*.stl' -exec rm -v {} \;
	find * -name '*.deps' -exec rm -v {} \;
	[ -d artifacts ] && rmdir artifacts || true

%.stl : %.scad
	time ${OPENSCAD} -m make -o $@ -d $<.deps $<

artifacts/%.stl : %.scad
	[ -d artifacts ] || mkdir -v artifacts
	time ${OPENSCAD} -m make -o $@ -d $<.deps $<

#EOF
