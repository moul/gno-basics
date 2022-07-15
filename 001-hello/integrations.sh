#!/bin/bash

. ../integrations.lib.sh

pre
call --pkgpath $(cat pkgpath.txt) --func "Hello"
post
