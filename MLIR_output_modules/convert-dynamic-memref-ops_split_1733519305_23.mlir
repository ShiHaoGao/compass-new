module {
  func.func @mixed_memref_dim(%arg0: memref<42x?x?x13x?xf32>) {
    %c0 = arith.constant 0 : index
    %dim = memref.dim %arg0, %c0 : memref<42x?x?x13x?xf32>
    %c1 = arith.constant 1 : index
    %dim_0 = memref.dim %arg0, %c1 : memref<42x?x?x13x?xf32>
    %c2 = arith.constant 2 : index
    %dim_1 = memref.dim %arg0, %c2 : memref<42x?x?x13x?xf32>
    %c3 = arith.constant 3 : index
    %dim_2 = memref.dim %arg0, %c3 : memref<42x?x?x13x?xf32>
    %c4 = arith.constant 4 : index
    %dim_3 = memref.dim %arg0, %c4 : memref<42x?x?x13x?xf32>
    return
  }
}