ifeq ($(shell uname -s),Darwin)
	OPENSCAD := /Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD
endif

ifeq (($shell uname -s),Linux)
	OPENSCAD := /usr/bin/openscad
endif

SHELL := bash

INDENT := 2>&1 | sed 's/^/    /'

make.targets :
	@echo "available Make targets:"
	@$(MAKE) -pRrq -f $(firstword $(MAKEFILE_LIST)) : 2>/dev/null \
	| awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' \
	| egrep -v '^make.targets$$' \
	| sed 's/^/    make    /' \
	| env LC_COLLATE=C sort




include $(shell find . -name '*.deps')

tidy :
	find * -name '*.deps' -exec rm -v {} \; ${INDENT}

clean : tidy
	find * -name '*~' -exec rm -v {} \; ${INDENT}
	find * -name '*.stl' -exec rm -v {} \; ${INDENT}
	([ -d artifacts ] && rmdir artifacts || true) ${INDENT}

%.stl : %.scad
	time ${OPENSCAD} -m make -o $@ -d $@.deps $<

artifacts/%.stl : %.scad
	uname -a
	env | sort
	[ -d artifacts ] || mkdir -v artifacts
	time ${OPENSCAD} -m make -o $@ -d $@.deps $<

#EOF
