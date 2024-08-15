name = guru
version = $(shell cat version)
prefix = /usr/local
tarball = $(name).tgz
installer = install-$(name)-v$(version)
dirs = bin
sources = $(foreach dir,$(dirs),$(wildcard $(dir)/*))

default: build

build: $(installer)

install: $(installer)
	./$<

clean:
	rm -rf $(tarball) $(installer)

$(tarball): $(sources)
	tar czf $@ $(dirs)

$(installer): $(tarball)
	bin/package --prefix=$(prefix) --output=$@ $<

.PHONY: default build clean
