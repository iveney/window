#include <iostream>
#include <oasis/names.h>
#include "MyBuilder.h"
#include "MyCell.h"
using namespace std;

//void MyBuilder::beginFile(const string&       version,
                          //const Oreal&        unit,
                          //Validation::Scheme  valScheme) {
  //cout << "Begin File" << endl;
//}

void MyBuilder::beginCell(CellName* cellName) {
  MyCell* cell = new MyCell(cellName);
  cellList.push_back(cell);         // create a new cell and store it
  cellDict.lookup(cellName, true);  // insert into the map
}
