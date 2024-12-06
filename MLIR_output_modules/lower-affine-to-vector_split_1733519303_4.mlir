module {
  func.func @vector_store_2d() {
    %alloc = memref.alloc() : memref<100x100xf32>
    %cst = arith.constant dense<1.100000e+01> : vector<2x8xf32>
    affine.for %arg0 = 0 to 16 step 2 {
      affine.for %arg1 = 0 to 16 step 8 {
        affine.vector_store %cst, %alloc[%arg0, %arg1] : memref<100x100xf32>, vector<2x8xf32>
      }
    }
    return
  }
}