
SUBMODULES = deps/euphrates/.git deps/czempak/.git

CZEMPAK = CZEMPAK_ROOT=$(PWD)/.czempak-root ./build/czempak

test: build/czempak
	$(CZEMPAK) run test/test.scm

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
