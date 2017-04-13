#! /rsusr/local/bin/bash

# Copy the files
cp -S a=.c "//'tsjlc.demo.c'" .
cp -S a=.h "//'tsjlc.demo.h'" .
cp -U -S a=.md "//'tsjlc.demo.txt'" .

# Fix the tags
chtag -tc1047 *.c *.h *.md

# Fix the modes (this is a little dubious...)
chmod 644 *.c *.h *.md
