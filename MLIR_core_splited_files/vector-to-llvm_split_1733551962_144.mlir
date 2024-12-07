module {
  func.func @gather_op(%arg0: memref<?xf32>, %arg1: vector<3xi32>, %arg2: vector<3xi1>, %arg3: vector<3xf32>) -> vector<3xf32> {
    %c0 = arith.constant 0 : index
    %0 = vector.gather %arg0[%c0] [%arg1], %arg2, %arg3 : memref<?xf32>, vector<3xi32>, vector<3xi1>, vector<3xf32> into vector<3xf32>
    return %0 : vector<3xf32>
  }
}