module {
  func.func @select_2d(%arg0: vector<4x3xi1>, %arg1: vector<4x3xi32>, %arg2: vector<4x3xi32>) {
    %0 = arith.select %arg0, %arg1, %arg2 : vector<4x3xi1>, vector<4x3xi32>
    return
  }
  func.func @index_cast_2d(%arg0: vector<1x2x3xi1>) {
    %0 = arith.index_cast %arg0 : vector<1x2x3xi1> to vector<1x2x3xindex>
    %1 = arith.index_cast %0 : vector<1x2x3xindex> to vector<1x2x3xi1>
    return
  }
}