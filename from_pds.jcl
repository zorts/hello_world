//FROMPDS JOB 1,'COPY TO PDS',CLASS=A,MSGCLASS=A
//STEP1 EXEC PGM=BPXBATCH
//STDOUT  DD SYSOUT=*
//*
//* See the notes in to_pds.jcl.
//STDPARM DD *
SH /bin/sh -c '
 set -x ;
 cd ~/hello_world ;
 rm -f *.h *.c *.md ;
 cp -S a=.c "//demo.c" . ;
 cp -S a=.h "//demo.h" . ;
 cp -U -S a=.md "//demo.txt" . ;
 chtag -tc1047 *.c *.h *.md ;
 chmod 644 *.c *.h *.md
 '
/*