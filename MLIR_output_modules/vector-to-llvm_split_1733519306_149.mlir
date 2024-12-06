module {
  func.func @gather_op_with_mask(%arg0: memref<?xf32>, %arg1: vector<2x3xi32>, %arg2: vector<2x3xf32>) -> vector<2x3xf32> {
    %c0 = arith.constant 0 : index
    %0 = vector.constant_mask [1, 2] : vector<2x3xi1>
    %1 = vector.gather %arg0[%c0] [%arg1], %0, %arg2 : memref<?xf32>, vector<2x3xi32>, vector<2x3xi1>, vector<2x3xf32> into vector<2x3xf32>
    return %1 : vector<2x3xf32>
  }
}