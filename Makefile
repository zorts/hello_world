default: test

test: hello
	./hello
	./hello with some arguments

hello: hello.o
	$(CC) -o $@ $<

hello.o: hello.c
	$(CC) -c -o $@ $<

clean:
	rm -f *.o hello