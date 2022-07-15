#!/bin/sh

GNO_WALLET=${GNO_WALLET:-moula}
GNO_HOME=${GNO_HOME:-~/.gno}
GNO_CHAINID=${GNO_CHAINID:-dev}
GNO_REMOTE=${GNO_REMOTE:-localhost:26657}
GNO_PKG_PATH=${GNO_PKG_PATH:-`cat pkgpath.txt`}
PUB_DOMAIN=${PUB_DOMAIN:-test2.gno.land}
PUB_REMOTE=${PUB_REMOTE:-test2.gno.land:36657}
PUB_CHAINID=${PUB_CHAINID:-test2}
GNO_CONTRACT_ENDPOINT=gno.land/${GNO_PKG_PATH}

pre() {
    echo "# [${GNO_PKG_PATH}](https://${PUB_DOMAIN}/${GNO_PKG_PATH})" > README.md
    echo >> README.md
}

post() {
    echo "" >> README.md
    echo "_generated with 'make integration'_" >> README.md
}

call() {
    echo '```console' >> README.md
    # simulate a console prompt; max 120 columns
    echo "foo@bar:~\$ gnokey maketx call \"MYWALLET\" --gas-fee 1ugnot --broadcast true --chainid \"${PUB_CHAINID}\" --remote \"${PUB_REMOTE}\" --gas-wanted 500000 $@" \
        | fold -s -w 118 \
        | sed '2,$s/^/> /' \
        | sed '$ ! s/$/ \\/' \
              >> README.md
    (
        set -ex
        gnokey maketx call "${GNO_WALLET}" --gas-fee 1ugnot --broadcast true --chainid "${GNO_CHAINID}" --remote "${GNO_REMOTE}" --gas-wanted 500000 --home "${GNO_HOME=_HOME}" $@
    ) | tee -a README.md
    echo '```' >> README.md
    echo >> README.md
}
