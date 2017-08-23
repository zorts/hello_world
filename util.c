#include "util.h"

void showArgs(FILE* file, int argc, const char* const argv[])
{
  if (argc < 2){
    fprintf(file, "command %s has no arguments\n", argv[0]);
  } else{
    fprintf(file, "command %s has %d arguments\n",
           argv[0], argc-1);
    for (int i=1; i < argc; ++i){
      fprintf(file, "[%d]: %s\n", i, argv[i]);
    }
  }
}

