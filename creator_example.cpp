#include "oasis/creator.h"

using namespace Oasis;

int main(){
  OasisCreatorOptions option(false);
  OasisCreator creator("data/my.oasis", option);
  creator.beginFile("1.0", 1000, Validation::Checksum32);

  auto_ptr<CellName>  acn(new CellName(string("NAND")));
  CellName*  cellName = acn.release();
  creator.registerCellName(cellName);

  creator.beginCell(cellName);
  PointList ptlist;
  ptlist.init(PointList::ManhattanHorizFirst);
  ptlist.addPoint(Delta(0,0));
  ptlist.addPoint(Delta(3,0));
  ptlist.addPoint(Delta(3,3));
  ptlist.addPoint(Delta(2,3));
  ptlist.addPoint(Delta(2,2));
  ptlist.addPoint(Delta(0,2));
  creator.beginPolygon(1,       // layer
                       0,       // datatype
                       0, 0,    // x, y
                       ptlist,  // point list
                       NULL);   // repitition
  creator.endCell();

  creator.endFile();
  return 0;
}
