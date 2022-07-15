#!/bin/bash

. ../integrations.lib.sh

pre
call --pkgpath ${GNO_CONTRACT_ENDPOINT} --func "Hello" --args "Universe"
call --pkgpath ${GNO_CONTRACT_ENDPOINT} --func "Hello" --args "Multiverse"
post
