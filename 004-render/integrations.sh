#!/bin/bash

. ../integrations.lib.sh

pre
call --pkgpath ${GNO_CONTRACT_ENDPOINT} --func "Render" --args "hello"
call --pkgpath ${GNO_CONTRACT_ENDPOINT} --func "Render" --args "foobar"
post
