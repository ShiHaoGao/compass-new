module {
  func.func @vector_load_2d() {
    %alloc = memref.alloc() : memref<100x100xf32>
    affine.for %arg0 = 0 to 16 step 2 {
      affine.for %arg1 = 0 to 16 step 8 {
        %0 = affine.vector_load %alloc[%arg0, %arg1] : memref<100x100xf32>, vector<2x8xf32>
      }
    }
    return
  }
}