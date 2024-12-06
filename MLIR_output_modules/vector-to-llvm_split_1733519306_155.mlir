module {
  func.func @scatter_2d_op(%arg0: memref<4x4xf32>, %arg1: vector<4xi32>, %arg2: vector<4xi1>, %arg3: vector<4xf32>) {
    %c3 = arith.constant 3 : index
    vector.scatter %arg0[%c3, %c3] [%arg1], %arg2, %arg3 : memref<4x4xf32>, vector<4xi32>, vector<4xi1>, vector<4xf32>
    return
  }
}