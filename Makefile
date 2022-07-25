
PREFIX = $(HOME)/.local
PREFIX_BIN = $(PREFIX)/bin

RUN_TARGET =
SCHREC_OPTS = --deterministic

SUBMODULES = deps/euphrates/.git

CZEMPAK = CZEMPAK_ROOT=$(PWD)/.czempak-root guile -s ./deps/czempak.scm

test: build/schrec
	build/schrec $(SCHREC_OPTS) example/state.scm

run: build/schrec
	build/schrec $(SCHREC_OPTS) $(RUN_TARGET)

build: build/schrec

build/schrec: src/*.scm
	mkdir build/
	$(CZEMPAK) install $(PWD)/src/main.scm $(PWD)/build/schrec

install: $(PREFIX_BIN)/schrec

$(PREFIX_BIN)/schrec: build/schrec $(PREFIX_BIN)
	cp $(PWD)/build/schrec $(PREFIX_BIN)/

$(PREFIX_BIN):
	make -p "$@"

examples: build/schrec
	@ for FILE in example/* ; do $(MAKE) run "RUN_TARGET=$$FILE" ; done

test-all:
	@ for FILE in test/test*.scm ; do $(MAKE) test-f "TESTFILE=$$FILE" ; done

test-f:
	$(CZEMPAK) run $(TESTFILE)

deps/euphrates/.git:
	git submodule update --init

clean:
	git clean -dfx
	git submodule foreach "$(MAKE) clean"

.PHONY: test clean build install all examples
