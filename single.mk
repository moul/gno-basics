GNO_WALLET ?= test1
GNO_HOME ?= ~/.gno
GNO_CHAINID ?= dev
GNO_REMOTE ?= localhost:26657

all: precompile build test publish integration

deps:
	@# done in the parent Makefile

precompile: deps
	gnodev precompile "./" --verbose

build: deps precompile
	gnodev build "./"

test: deps
	gnodev test "./" --verbose

publish: deps
	@# create temp dir with just the .gno files
	rm -rf .tmp/; mkdir -p .tmp/; cp *.gno .tmp/
	gnokey maketx addpkg "$(GNO_WALLET)" \
		--deposit 100ugnot \
		--gas-fee 1ugnot \
		--gas-wanted 5000000 \
		--broadcast true \
		--remote $(GNO_REMOTE) \
		--chainid $(GNO_CHAINID) \
		--home $(GNO_HOME) \
		--pkgpath `cat pkgpath.txt` \
		--pkgdir "./.tmp/"

integration: deps
	GNO_HOME=$(GNO_HOME) GNO_WALLET=$(GNO_WALLET) GNO_CHAINID=$(GNO_CHAINID) GNO_REMOTE=$(GNO_REMOTE) ./integrations.sh
