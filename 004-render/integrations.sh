#!/bin/bash

. ../integrations.lib.sh

pre
call --pkgpath $(cat pkgpath.txt) --func "Render" --args "hello"
call --pkgpath $(cat pkgpath.txt) --func "Render" --args "foobar"
post
