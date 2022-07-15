#!/bin/bash

. ../integrations.lib.sh

pre
call --pkgpath ${GNO_CONTRACT_ENDPOINT} --func "Add" --args "42"
call --pkgpath ${GNO_CONTRACT_ENDPOINT} --func "Add" --args "295"
post
