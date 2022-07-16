GNO_WALLET ?= test1
GNO_HOME ?= ~/.gno
GNO_CHAINID ?= dev
GNO_REMOTE ?= localhost:26657
GNO_PKG_PATH ?= `cat pkgpath.txt`
GNO_ROOT ?= `go list -m -mod=mod -f "{{.Dir}}" github.com/gnolang/gno`

all-default: precompile build test publish integration

deps-default:
	@# done in the parent Makefile

precompile-default: deps
	@rm -rf .tmp/
	gnodev precompile "./" --verbose

build-default: deps precompile-default
	@rm -rf .tmp/
	gnodev build "./"

test-default: deps
	@rm -rf .tmp/
	gnodev test "./" --verbose

publish_pkg =	gnokey maketx addpkg "$(GNO_WALLET)" \
		--deposit 100ugnot \
		--gas-fee 1ugnot \
		--gas-wanted 5000000 \
		--broadcast true \
		--remote $(GNO_REMOTE) \
		--chainid $(GNO_CHAINID) \
		--home $(GNO_HOME) \
		--pkgpath $(1) \
		--pkgdir $(2)

publish-default: deps
	@# create temp dir with just the .gno files
	rm -rf .tmp/; mkdir -p .tmp/; cp *.gno .tmp/
	$(call publish_pkg,gno.land/$(GNO_PKG_PATH),./.tmp/)

integration-default: deps
	GNO_HOME=$(GNO_HOME) GNO_WALLET=$(GNO_WALLET) GNO_CHAINID=$(GNO_CHAINID) GNO_REMOTE=$(GNO_REMOTE) GNO_PKG_PATH=$(GNO_PKG_PATH) ./integrations.sh

clean-default:
	rm -f $(wildcard *.gno.gen*) $(wildcard .*.gno.gen*)

%: %-default # handles cases where we don't want to override
	@true
