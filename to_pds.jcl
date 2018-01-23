//TOPDS JOB 1,'COPY TO PDS',CLASS=A,MSGCLASS=A
//STEP1 EXEC PGM=BPXBATCH
//STDOUT  DD SYSOUT=*
//*
//* Some notes:
//*
//* The destination dataset names use the syntax specified here
//* (WARNING: URL split actoss 2 lines):
//* https://www.ibm.com/support/knowledgecenter/SSLTBW_2.3.0/
//*         com.ibm.zos.v2r3.cbcpx01/cbc1p210.htm
//*
//* In particular, the names will be prefixed with the high level
//* qualifier of the TSOID under which the job runs. To use absolute
//* names, put them in single quotes, like:
//*
//* "//'SYS1.MACLIB'"
//*
//* Also, this job uses the shell's "-c" option to pass a command
//* line to the shell. This means that:
//*
//* * The lines aren't really separate lines; they are effectively
//*   concatenated to make one long line.
//* * Hence, the commands are separated by semicolons, and...
//* * ...you can't put in comment lines, and...
//* * ...any single quotes must themselves be quoted with a backslash.
//*
//STDPARM DD *
SH /bin/sh -c '
 set -x ;
 cd ~/hello_world ;
 cp -S d=.c *.c "//demo.c" ;
 cp -S d=.h *.h "//demo.h" ;
 cp -S d=.md *.md "//demo.txt" ;
 '
/*