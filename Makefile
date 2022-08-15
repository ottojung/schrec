
PREFIX = $(HOME)/.local
PREFIX_BIN = $(PREFIX)/bin

RUN_TARGET =
SCHREC_OPTS = --nondeterministic

SUBMODULES = deps/euphrates/.git

CZEMPAK = CZEMPAK_ROOT=$(PWD)/.czempak-root guile -s ./deps/czempak.scm

test: dist/schrec
	dist/schrec $(SCHREC_OPTS) example/const.scm

run: dist/schrec
	dist/schrec $(SCHREC_OPTS) $(RUN_TARGET)

build: dist/schrec

dist/schrec: src/*.scm dist
	$(CZEMPAK) install $(PWD)/src/main.scm $(PWD)/dist/schrec

dist:
	mkdir -p dist

install: $(PREFIX_BIN)/schrec

$(PREFIX_BIN)/schrec: dist/schrec $(PREFIX_BIN)
	cp $(PWD)/dist/schrec $(PREFIX_BIN)/

$(PREFIX_BIN):
	mkdir -p "$@"

examples: dist/schrec
	@ for FILE in example/* ; do $(MAKE) run "RUN_TARGET=$$FILE" ; done

test-all: dist/schrec
	@ for FILE in test/test*.scm ; do $(MAKE) test-scm "TESTFILE=$$FILE" ; done
	@ for FILE in test/test*.sh ; do $(MAKE) test-sh "TESTFILE=$$FILE" ; done

test-scm:
	$(CZEMPAK) run $(TESTFILE)
test-sh:
	sh $(TESTFILE)

deps/euphrates/.git:
	git submodule update --init

clean:
	git clean -dfx
	git submodule foreach "$(MAKE) clean"

.PHONY: test clean build install all examples
