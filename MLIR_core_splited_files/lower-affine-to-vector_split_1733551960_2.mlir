module {
  func.func @affine_vector_store(%arg0: index) {
    %alloc = memref.alloc() : memref<100xf32>
    %cst = arith.constant dense<1.100000e+01> : vector<4xf32>
    affine.for %arg1 = 0 to 16 {
      affine.vector_store %cst, %alloc[%arg1 - symbol(%arg0) + 7] : memref<100xf32>, vector<4xf32>
    }
    return
  }
}