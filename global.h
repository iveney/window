#ifndef __GLOBAL_H__

#define __GLOBAL_H__

#include <vector>
#include <oasis/names.h>
#include <oasis/dicts.h>
using namespace Oasis;
using std::vector;

const int MAX_CELLNAME_LEN = 20;

class MyCell;
typedef vector<MyCell*> CellList;
typedef vector<CellName*> CellNameList;

#endif /* end of include guard: __GLOBAL_H__ */

