
test: build/czempak
	build/czempak run test/test.scm

build/czempak: submodules
	cd deps/czempak && $(MAKE) PREFIXBIN=$(PWD)/build

submodules: deps/euphrates/.git deps/czempak/.git

deps/czempak/.git:
	git submodule update --init

deps/euphrates/.git:
	git submodule update --init

.PHONY: test submodules
