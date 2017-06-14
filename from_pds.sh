#!/bin/env bash

# Copy the files
cp -S a=.c "//demo.c" .
cp -S a=.h "//demo.h" .
cp -U -S a=.md "//demo.txt" .

# Fix the tags
chtag -tc1047 *.c *.h *.md

# Fix the modes (this is a little dubious...)
chmod 644 *.c *.h *.md

# See if anything changed
git status