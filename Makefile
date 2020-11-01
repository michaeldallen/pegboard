ifeq ($(shell uname -s),Darwin)
	OPENSCAD := /Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD
else ifeq ($(shell uname -s),Linux)
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


diag :
	uname -a
	uname -s
	env | sort

tidy :
	find * -name '*.deps' -exec rm -v {} \; ${INDENT}

clean : tidy
	find * -type f -name '*~' -exec rm -v {} \; ${INDENT}
	find * -type f -name '*.stl' -exec rm -v {} \; ${INDENT}
	([ -d artifacts ] && rmdir artifacts || true) ${INDENT}

%.stl : %.scad
	time ${OPENSCAD} -d $@.deps -o $@ $<
	@echo .
	@echo .
	@echo .


artifacts/%.stl : %.stl
	@[ -d artifacts ] || mkdir -v artifacts
	cp $< $@


everything :
	@for s in *.scad ; do \
		${MAKE} --no-print-directory ${MAKEFLAGS} artifacts/$$(basename $$s .scad).stl ; \
	done

#EOF

