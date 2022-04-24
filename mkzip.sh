#!/bin/sh

rm -f 2003.zip
git archive --format=zip -o 2003.zip --prefix=2003/ HEAD
