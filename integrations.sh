#!/bin/sh

GNO_WALLET=${GNO_WALLET:-moula}
GNO_HOME=${GNO_HOME:-~/.gno}
GNO_CHAINID=${GNO_CHAINID:-dev}
GNO_REMOTE=${GNO_REMOTE:-localhost:26657}

rm */out.txt

call() {
    dir=$1
    shift
    echo '[embedmd]:# (out.txt console)' > $dir/README.md
    _call $@ 2>&1 | tee -a $dir/out.txt
}

_call() {
    echo "foo@bar:~\$ gnokey maketx call \"MYWALLET\" --gas-fee 1ugnot --broadcast true --chainid \"${GNO_CHAINID}\" --remote \"${GNO_REMOTE}\" \\"
    echo "> --gas-wanted 200000 $@"
    gnokey maketx call "${GNO_WALLET}" --gas-fee 1ugnot --broadcast true --chainid "${GNO_CHAINID}" --remote "${GNO_REMOTE}" --gas-wanted 200000 --home "${GNO_HOME}" $@
}

#call 001-hello --pkgpath "gno.land/r/moul_basics_001" --func "Hello"
#call 002-args --pkgpath "gno.land/r/moul_basics_002" --func "Hello" --args "Universe"
#call 002-args --pkgpath "gno.land/r/moul_basics_002" --func "Hello" --args "Multiverse"
call 003-data --pkgpath "gno.land/r/moul_basics_003" --func "Add" --args "42"
call 003-data --pkgpath "gno.land/r/moul_basics_003" --func "Add" --args "295"
