#!/bin/sh

GNO_WALLET=${GNO_WALLET:-moula}
GNO_HOME=${GNO_HOME:-~/.gno}
GNO_CHAINID=${GNO_CHAINID:-dev}
GNO_REMOTE=${GNO_REMOTE:-localhost:26657}
GNO_PKGPATH=${GNO_PKGPATH:-`cat pkgpath.txt`}
PUB_URL=`echo $GNO_PKGPATH | sed s@gno.land/@test2.gno.land/@`

pre() {
    echo "# [${GNO_PKGPATH}](https://${PUB_URL})" > README.md
    echo >> README.md
}

post() {
    echo "" >> README.md
    echo "_generated with 'make integration'_" >> README.md
}

call() {
    echo '```console' >> README.md
    # simulate a console prompt; max 120 columns
    echo "foo@bar:~\$ gnokey maketx call \"MYWALLET\" --gas-fee 1ugnot --broadcast true --chainid \"${GNO_CHAINID}\" --remote \"${GNO_REMOTE}\" --gas-wanted 500000 $@" \
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

#call 001-hello --pkgpath "gno.land/r/moul_basics_001" --func "Hello"
#call 002-args --pkgpath "gno.land/r/moul_basics_002" --func "Hello" --args "Universe"
#call 002-args --pkgpath "gno.land/r/moul_basics_002" --func "Hello" --args "Multiverse"
#call 003-data --pkgpath "gno.land/r/moul_basics_003" --func "Add" --args "42"
#call 003-data --pkgpath "gno.land/r/moul_basics_003" --func "Add" --args "295"
#call 004-render --pkgpath "gno.land/r/moul_basics_004" --func "Render" --args "hello"
#call 004-render --pkgpath "gno.land/r/moul_basics_004" --func "Render" --args "foobar"
