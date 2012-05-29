#include <iostream>
#include <string>
#include <functional>
#include <misc/utils.h>
#include <oasis/parser.h>
#include "MyBuilder.h"
using namespace std;
using namespace Oasis;

static void DisplayWarning(const char* msg) {
  cerr << msg << endl;
}

void ProcessFile(const char* path) {
  OasisParserOptions options;
  OasisParser parser(path, 
                     DisplayWarning,
                     //bind1st(mem_fun(&MyBuilder::ShowWarning), &builder)
                     options);
  MyBuilder builder;
  parser.parseFile(&builder);
}

int main(int argc, const char *argv[])
{
  static string usage = "Usage: window oasis-file";
  // check argument
  if(argc<2) {
    cerr << usage << endl;
    exit(1);
  }

  ProcessFile(argv[1]);
  
  return 0;
}
