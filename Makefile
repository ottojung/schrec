
PREFIX = $(HOME)/.local
PREFIX_BIN = $(PREFIX)/bin
PREFIX_SHARE = $(PREFIX)/share

RUN_TARGET = example/const-multi.scm
SCHREC_OPTS = --results all

SUBMODULES = deps/euphrates/.git

GUILE = guile -L src -L test

run: dist/schrec
	dist/schrec $(SCHREC_OPTS) $(RUN_TARGET)

build: dist/schrec
	@ dist/schrec version >/dev/null

dist/schrec: src/schrec/*.scm dist $(SUBMODULES)
	sh scripts/install.sh $(PWD)/src "$@"

dist:
	mkdir -p dist

install: $(PREFIX_BIN)/schrec

uninstall:
	rm -f $(PREFIX_BIN)/schrec
	rm -rf $(PREFIX_SHARE)/shrec

$(PREFIX_BIN)/schrec: dist/schrec $(PREFIX_BIN) $(PREFIX_SHARE)/schrec
	cp -T -L -r $(PWD)/src $(PREFIX_SHARE)/schrec/src
	sh scripts/install.sh $(PREFIX_SHARE)/schrec/src "$@"

$(PREFIX_SHARE)/schrec:
	mkdir -p "$@"

$(PREFIX_BIN):
	mkdir -p "$@"

test: dist/schrec
	@ set -e ; for FILE in test/test*.scm ; do $(MAKE) test-scm "TESTFILE=$$FILE" ; done
	@ set -e ; for FILE in test/test*.sh ; do $(MAKE) test-sh "TESTFILE=$$FILE" ; done

test-scm:
	$(GUILE) $(TESTFILE)
test-sh:
	sh $(TESTFILE)

deps/euphrates/.git:
	git submodule update --init

clean:
	rm -rf dist/

.PHONY: test test-scm test-sh clean build install uninstall all
