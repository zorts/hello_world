#!/bin/env bash

# Copy the files. See the comments in to_pds.sh for more information.
cp -S a=.c "//demo.c" .
cp -S a=.h "//demo.h" .
cp -U -S a=.md "//demo.txt" .

# Make sure that the returned files are tagged as EBCDIC (IBM-1047)
chtag -tc1047 *.c *.h *.md

# Make sure that the file modes are appropriate
chmod 644 *.c *.h *.md

# See if anything changed
git status