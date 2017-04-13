default: test

CC := c99

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