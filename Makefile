
SUBMODULES = deps/euphrates/.git deps/czempak/.git

CZEMPAK = CZEMPAK_ROOT=$(PWD)/.czempak-root ./build/czempak

test: build/czempak
	$(CZEMPAK) run test/test.scm

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

.PHONY: test clean
