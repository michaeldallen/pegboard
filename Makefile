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

clean :
	find * -type f -name '*~' -exec rm -v {} \; ${INDENT}
	find * -type f -name '*.stl' -exec rm -v {} \; ${INDENT}
	find * -name '*.deps' -exec rm -v {} \; ${INDENT}
	([ -d artifacts ] && rmdir artifacts || true) ${INDENT}
	([ -d cache ] && rmdir cache || true) ${INDENT}

tidy :
	find artifacts -type f -name '*.stl' -exec rm -v {} \; ${INDENT}
	([ -d artifacts ] && rmdir artifacts || true) ${INDENT}

cache/%.stl : %.scad
	[ -d cache ] || mkdir -v cache
	date
	time ${OPENSCAD} -d $@.deps -o $@ $<
	date
	@echo .
	@echo .
	@echo .

cache/%.png : %.scad
	[ -d cache ] || mkdir -v cache
	date
	time ${OPENSCAD} -d $@.deps -o $@ $<
	date
	@echo .
	@echo .
	@echo .


artifacts/% : cache/%
	@[ -d artifacts ] || mkdir -v artifacts
	cp $< $@


everything all :
	@for s in *.scad ; do \
		[ -r $$s ] && ${MAKE} --no-print-directory ${MAKEFLAGS} artifacts/$$(basename $$s .scad).stl artifacts/$$(basename $$s .scad).png ; \
	done

readme.gitlab_container_registry:
	@echo docker login registry.gitlab.com
	@echo docker build -t registry.gitlab.com/michaeldallen/pegboard:2020.11 .
	@echo  docker push registry.gitlab.com/michaeldallen/pegboard:2020.11

#EOF

