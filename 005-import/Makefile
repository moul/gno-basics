-include ../single.mk

# ''gnodev build' does not work yet w/ this demo.
build:
	@exit 0

# install gno.land/p/dom if not yet existing
publish: publish-dom publish-default
publish-dom:
	$(call publish_pkg,gno.land/p/demo/dom,"${GNO_ROOT}/examples/gno.land/p/demo/dom")
