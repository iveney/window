#ifndef __MYBUILDER_H__
#define __MYBUILDER_H__

#include <iostream>
#include <oasis/parser.h>
#include <oasis/builder.h>
#include "global.h"
using namespace Oasis;
using std::string;

class MyBuilder : public OasisBuilder{
public:
 //MyBuilder() : OasisBuilder() {};
 
 // override virtual methods
 //virtual void beginFile(const string&       version,
                        //const Oreal&        unit,
                        //Validation::Scheme  valScheme);
 //virtual void registerCellName(CellName* cellName);
 virtual void beginCell(CellName* cellName);

private:
 // needs a vector to store all the cell objects
 CellList cellList;

 // needs a lookup table (CellDict) to map CellName to Cell Object
 CellDict cellDict;
};

#endif /* end of include guard: __MYBUILDER_H__ */
