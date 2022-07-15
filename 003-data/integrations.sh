#!/bin/bash

. ../integrations.lib.sh

pre
call --pkgpath $(cat pkgpath.txt) --func "Add" --args "42"
call --pkgpath $(cat pkgpath.txt) --func "Add" --args "295"
post
