PUBLISHER_WALLET ?= moul
PUBLISH_PATH ?= "gno.land/r/moul-hello"
GNOKEY ?= go run github.com/gnolang/gno/cmd/gnokey
GNODEV ?= go run github.com/gnolang/gno/cmd/gnodev
GNO_HOME ?= ~/.gno

all: test

test:
	$(GNODEV) test "./hello"

precompile:
	$(GNODEV) precompile "./hello"

build: precompile
	$(GNODEV) build "./hello"

publish-local:
	$(GNOKEY) maketx addpkg "$(PUBLISHER_WALLET)" \
		--pkgpath "$(PUBLISH_PATH)" \
		--pkgdir "./hello" \
		--deposit 100gnot \
		--gas-fee 1gnot \
		--gas-wanted 2000000 \
		--broadcast true \
		--remote localhost:26657 \
		--chainid testchain \
		--home $(GNO_HOME)


publish-testnet:
	@echo TODO
