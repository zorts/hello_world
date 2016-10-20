#include <stdio.h>

int main(int argc, char**argv)
{
  int i;
  printf("Hello, world!\n"
         "This command is %s, and it has %d arguments\n",
         argv[0], argc-1);
  for (i=1; i < argc; ++i){
    printf("[%d]: %s\n", i, argv[i]);
  }
  return 0;
}
