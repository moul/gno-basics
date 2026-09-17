.PHONY: all test lint fmt dev install_deps

all: fmt test lint

# Run all tests
test:
	gno test ./... -v

# Run linter
lint:
	gno lint ./...

# Format the code
fmt:
	gno fmt -w ./...

# Local chain with hot reload, serving every example
dev:
	gnodev

install_deps:
	# --from-source is required: the installer's prebuilt-binary mode resolves
	# "latest" against GitHub releases, and gnolang/gno's v* tags have no
	# release objects. See gnolang/gno#6195.
	curl --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/gnolang/gno/master/misc/install.sh | sh -s -- --from-source
	@echo '>> binaries are in $$HOME/.gno/bin — add it to your PATH:'
	@echo '   export PATH="$$HOME/.gno/bin:$$PATH"'
