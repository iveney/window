#ifndef __MYBUILDER_H__

#define __MYBUILDER_H__

#include <oasis/parser.h>
#include <oasis/builder.h>
using namespace Oasis;

class MyBuilder : public OasisBuilder{
public:
 // override all vertiaul methods
 virtual void beginFile();
 virtual void endFile();
 static void ShowWarning(const char* msg);

private:
  /* data */
};

#endif /* end of include guard: __MYBUILDER_H__ */
