#!/bin/sh

GNO_WALLET=${GNO_WALLET:-moula}
GNO_HOME=${GNO_HOME:-~/.gno}
GNO_CHAINID=${GNO_CHAINID:-dev}
GNO_REMOTE=${GNO_REMOTE:-localhost:26657}

call() {
    echo "\$> gnokey maketx call MYWALLET --gas-fee 1ugnot --broadcast true --chainid ${GNO_CHAINID} --remote ${GNO_REMOTE} --gas-wanted 200000 $@"
    gnokey maketx call "${GNO_WALLET}" --gas-fee 1ugnot --broadcast true --chainid "${GNO_CHAINID}" --remote "${GNO_REMOTE}" --gas-wanted 200000 --home "${GNO_HOME}" $@
}

call --pkgpath "gno.land/r/moul_basics_001" --func "Hello"
