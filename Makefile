PUBLISHER_WALLET ?= moul
GNOKEY ?= go run github.com/gnolang/gno/cmd/gnokey
GNODEV ?= go run github.com/gnolang/gno/cmd/gnodev
GNO_HOME ?= ~/.gno
GNO_CHAINID ?= dev
GNO_REMOTE ?= localhost:26657
GNO_ROOT ?= `go list -m -mod=mod -f "{{.Dir}}" github.com/gnolang/gno`

all: precompile build test publish

precompile:
	$(GNODEV) precompile "./" --verbose

build: precompile
	$(GNODEV) build "./" --verbose

test:
	$(GNODEV) test "./" --verbose

publish:
	$(GNOKEY) maketx addpkg "$(PUBLISHER_WALLET)" --deposit 100ugnot --gas-fee 1ugnot --gas-wanted 2000000 --broadcast true --remote $(GNO_REMOTE) --chainid $(GNO_CHAINID) --home $(GNO_HOME) --pkgpath "gno.land/r/moul_basics_001" --pkgdir "./001-hello"

#server: tidy
#	cd "$(GNO_ROOT)" && go run ./cmd/gnoland

#clean: tidy
#	cd "$(GNO_ROOT)" && rm -rf testdir

tidy:
	go mod tidy
