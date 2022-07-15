GNO_WALLET ?= test1
GNO_HOME ?= ~/.gno
GNO_CHAINID ?= dev
GNO_REMOTE ?= localhost:26657

all: precompile build test publish

deps:
	go mod tidy
	go install github.com/gnolang/gno/cmd/gnokey
	go install github.com/gnolang/gno/cmd/gnodev

precompile: deps
	gnodev precompile "./" --verbose

build: deps precompile
	gnodev build "./" --verbose

test: deps
	gnodev test "./" --verbose

publish: deps
	#gnokey maketx addpkg "$(GNO_WALLET)" --deposit 100ugnot --gas-fee 1ugnot --gas-wanted 5000000 --broadcast true --remote $(GNO_REMOTE) --chainid $(GNO_CHAINID) --home $(GNO_HOME) --pkgpath "gno.land/r/moul_basics_001" --pkgdir "./001-hello"
	#gnokey maketx addpkg "$(GNO_WALLET)" --deposit 100ugnot --gas-fee 1ugnot --gas-wanted 5000000 --broadcast true --remote $(GNO_REMOTE) --chainid $(GNO_CHAINID) --home $(GNO_HOME) --pkgpath "gno.land/r/moul_basics_002" --pkgdir "./002-args"
	#gnokey maketx addpkg "$(GNO_WALLET)" --deposit 100ugnot --gas-fee 1ugnot --gas-wanted 5000000 --broadcast true --remote $(GNO_REMOTE) --chainid $(GNO_CHAINID) --home $(GNO_HOME) --pkgpath "gno.land/r/moul_basics_003" --pkgdir "./003-data"
	gnokey maketx addpkg "$(GNO_WALLET)" --deposit 100ugnot --gas-fee 1ugnot --gas-wanted 5000000 --broadcast true --remote $(GNO_REMOTE) --chainid $(GNO_CHAINID) --home $(GNO_HOME) --pkgpath "gno.land/r/moul_basics_004" --pkgdir "./004-render"

integration: deps
	GNO_HOME=$(GNO_HOME) GNO_WALLET=$(GNO_WALLET) GNO_CHAINID=$(GNO_CHAINID) GNO_REMOTE=$(GNO_REMOTE) ./integrations.sh
	for file in */README.md; do go run github.com/campoy/embedmd -w $$file; done

#GNO_ROOT ?= `go list -m -mod=mod -f "{{.Dir}}" github.com/gnolang/gno`
#server:
#	cd "$(GNO_ROOT)" && go run ./cmd/gnoland
#clean:
#	cd "$(GNO_ROOT)" && rm -rf testdir
