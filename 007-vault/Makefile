-include ../single.mk

build:
	@exit 0

# install missing packages.
publish: publish-vault publish-default
publish-vault:
	$(call publish_pkg,gno.land/p/grc/exts/vault,"${GNO_ROOT}/examples/gno.land/p/grc/exts/vault")
