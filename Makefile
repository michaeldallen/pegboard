ifeq ($(shell uname -s),Darwin)
	OPENSCAD := /Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD
else ifeq ($(shell uname -s),Linux)
	OPENSCAD := /usr/bin/openscad
endif

.PRECIOUS: cache/%.stl

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

diag :
	uname -a
	uname -s
	env | sort

tidy :
	find * -name '*.deps' -exec rm -v {} \; ${INDENT}

clean : tidy
	find * -name '*~' -exec rm -v {} \; ${INDENT}
	find * -name '*.stl' -exec rm -v {} \; ${INDENT}
	([ -d artifacts ] && rmdir -v artifacts || true) ${INDENT}
	([ -d cache ] && rmdir -v cache || true) ${INDENT}

cache/%.stl : %.scad
	@[ -d cache ] || mkdir -v cache
	time ${OPENSCAD} -o $@ -d $@.deps $<
	@echo .
	@echo .
	@echo .


artifacts/%.stl : cache/%.stl 
	@[ -d artifacts ] || mkdir -v artifacts
	cp -v --preserve=all $< $@


everything :
	@for s in *.scad ; do \
		${MAKE} --no-print-directory ${MAKEFLAGS} artifacts/$$(basename $$s .scad).stl ; \
	done

#EOF

