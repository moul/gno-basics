#!/bin/bash

. ../integrations.lib.sh

pre
#call --pkgpath ${GNO_CONTRACT_ENDPOINT} --func "FooToken.BalanceOf" --args "g1jg8mtutu9khhfwc4nxmuhcpftf0pajdhfvsqf5"
call --pkgpath ${GNO_CONTRACT_ENDPOINT} --func "Deposit" --args "10000" --args "g1myrecoveryaddress"
call --pkgpath ${GNO_CONTRACT_ENDPOINT} --func "MyBalance"
post
