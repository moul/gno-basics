#!/bin/bash

. ../integrations.lib.sh

pre
call --pkgpath $(cat pkgpath.txt) --func "Hello" --args "Universe"
call --pkgpath $(cat pkgpath.txt) --func "Hello" --args "Multiverse"
post
