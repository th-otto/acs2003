#!/bin/sh

for i in `find . \( -name "*.s" -o -name "*.c" -o -name "*.h" \)`; do cp -a "$i" ../2003/src/$i; done
(cd ..; zip -r 2003.zip 2003)
