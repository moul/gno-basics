#!/bin/bash

. ../integrations.lib.sh

pre
call --pkgpath ${GNO_CONTRACT_ENDPOINT} --func "Hello"
post
