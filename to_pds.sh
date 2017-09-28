#!/bin/env bash

# Copy the files. The "-s" option is z/OS-specific; it controls 
# the way that file suffices are handled. In this case, "-S d="
# is used to deleted the specified suffix, so that the member name
# will just be the min part of the file name.
#
# For more information, see:
#
# https://www.ibm.com/support/knowledgecenter/SSLTBW_2.2.0/com.ibm.zos.v2r2.bpxa500/cp.htm

cp -S d=.c *.c "//demo.c"
cp -S d=.h *.h "//demo.h"
cp -S d=.md *.md "//demo.txt"
