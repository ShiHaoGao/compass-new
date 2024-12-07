module {
  func.func @affine_vector_load(%arg0: index) {
    %alloc = memref.alloc() : memref<100xf32>
    affine.for %arg1 = 0 to 16 {
      %0 = affine.vector_load %alloc[%arg1 + symbol(%arg0) + 7] : memref<100xf32>, vector<8xf32>
    }
    return
  }
}