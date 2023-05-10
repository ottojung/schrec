
PREFIX = $(HOME)/.local
PREFIX_BIN = $(PREFIX)/bin
PREFIX_SHARE = $(PREFIX)/share

RUN_TARGET =
SCHREC_OPTS = --results all

SUBMODULES = deps/euphrates/.git

GUILE = guile -L src

test: dist/schrec
	dist/schrec $(SCHREC_OPTS) example/const-multi.scm

test2: dist/schrec
	$(GUILE) test/glisp/lispytest.scm

run: dist/schrec
	dist/schrec $(SCHREC_OPTS) $(RUN_TARGET)

build: dist/schrec

dist/schrec: src/schrec/*.scm dist
	sh scripts/install.sh $(PWD) "$@"

dist:
	mkdir -p dist

install: $(PREFIX_BIN)/schrec

$(PREFIX_BIN)/schrec: dist/schrec $(PREFIX_BIN) $(PREFIX_SHARE)/schrec
	cp -L -r $(PWD)/src $(PREFIX_SHARE)/schrec/src
	sh scripts/install.sh $(PREFIX_SHARE)/schrec/src "$@"

$(PREFIX_SHARE)/schrec:
	mkdir -p "$@"

$(PREFIX_BIN):
	mkdir -p "$@"

examples: dist/schrec
	@ for FILE in example/* ; do $(MAKE) run "RUN_TARGET=$$FILE" ; done

test-all: dist/schrec
	@ for FILE in test/test*.scm ; do $(MAKE) test-scm "TESTFILE=$$FILE" ; done
	@ for FILE in test/test*.sh ; do $(MAKE) test-sh "TESTFILE=$$FILE" ; done

test-scm:
	$(GUILE) $(TESTFILE)
test-sh:
	sh $(TESTFILE)

deps/euphrates/.git:
	git submodule update --init

clean:
	git clean -dfx
	git submodule foreach "$(MAKE) clean"

.PHONY: test clean build install all examples
