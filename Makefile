
PREFIX = $(HOME)/.local
PREFIX_BIN = $(PREFIX)/bin

SUBMODULES = deps/euphrates/.git deps/czempak/.git

CZEMPAK = CZEMPAK_ROOT=$(PWD)/.czempak-root ./build/czempak

test: build/czempak
	$(CZEMPAK) run test/test.scm

build: build/schrec

build/schrec: build/czempak src/*.scm
	$(CZEMPAK) install $(PWD)/src/main.scm $(PWD)/build/schrec

install: $(PREFIX_BIN)/schrec

$(PREFIX_BIN)/schrec: build/schrec $(PREFIX_BIN)
	cp $(PWD)/build/schrec $(PREFIX_BIN)/

$(PREFIX_BIN):
	make -p "$@"

example: build/czempak
	$(MAKE) test-f "TESTFILE=test/example.scm"

test-all: build/czempak
	@ for FILE in test/test*.scm ; do $(MAKE) test-f "TESTFILE=$$FILE" ; done

test-f:
	$(CZEMPAK) run $(TESTFILE)

build/czempak: $(SUBMODULES)
	cd deps/czempak && $(MAKE) PREFIXBIN=$(PWD)/build

deps/czempak/.git:
	git submodule update --init

deps/euphrates/.git:
	git submodule update --init

clean:
	git clean -dfx
	git submodule foreach "$(MAKE) clean"

.PHONY: test clean build install all
