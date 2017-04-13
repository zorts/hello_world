#include "util.h"

void showArgs(FILE* file, int argc, const char* const argv[])
{
  if (argc < 2){
    printf("command %s has no arguments\n", argv[0]);
  } else{
    printf("command %s has %d arguments\n",
           argv[0], argc-1);
    for (int i=1; i < argc; ++i){
      printf("[%d]: %s\n", i, argv[i]);
    }
  }
}

