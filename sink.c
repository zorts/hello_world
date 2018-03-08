#include <stdio.h>
#include <fcntl.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <errno.h>

int main(int argc, const char* const argv[])
{
  if (argc != 2){
    fprintf(stderr, "usage: %s <file to read>\n", argv[0]);
    exit(1);
  }

  int fd = open(argv[1], O_RDONLY);
  if (fd < 0){
    int error = errno;
    fprintf(stderr, "open(%s, O_RDONLY) failed: %d (%s)\n", argv[1], error, strerror(error));
    exit(1);
  }
  
  unsigned char buffer[1024];
  ssize_t bytesRead = 0, bytesTotal = 0;

  while (0 < (bytesRead = read(fd, buffer, sizeof(buffer)))){
    bytesTotal += bytesRead;
    ssize_t bytesWritten = write(1, buffer, (size_t) bytesRead);
    if (bytesWritten != bytesRead){
      int error = errno;
      fprintf(stderr, "write for %d bytes failed after %d bytes: %d (%s)\n",
              (int) bytesRead, (int) bytesTotal, error, strerror(error));
      exit(1);
    }
  }

  if (bytesRead < 0){
    int error = errno;
    fprintf(stderr, "read for %d bytes failed after %d bytes: %d (%s)\n",
            (int) (sizeof(buffer)), (int) bytesTotal, error, strerror(error));
    exit(1);
  }

  fprintf(stderr, "read %d bytes from %s\n",(int) bytesTotal, argv[1]);
  close(fd);
  return 0;
}
