UNAME_KERNEL  := $(shell uname -s)
UNAME_MACHINE := $(shell uname -m)

ifeq "${UNAME_KERNEL}" "OS/390"
OSTYPE := zOS
else
ifeq "${UNAME_KERNEL}" "Linux"
ifeq "${UNAME_MACHINE}" "s390x"
OSTYPE := zLinux
else
OSTYPE := Linux
endif
else
$(error "Unknown kernel type ${UNAME_KERNEL}")
endif
endif

EMPTY =

ifeq "${OSTYPE}" "zOS"
CC := c99
else
ifeq "${OSTYPE}" "zLinux"
CC := gcc -std=c99
else
$(error "Unknown OSTYPE ${OSTYPE}")
endif
endif

default: test


test: hello
	./hello
	./hello with some arguments

hello: hello.o util.o
	$(CC) -o $@ $^

hello.o: hello.c
	$(CC) -c -o $@ $<

util.o: util.c
	$(CC) -c -o $@ $<

clean:
	rm -f *.o hello
