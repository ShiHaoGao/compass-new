module {
  func.func @memref_cast_mixed_to_mixed(%arg0: memref<42x?xf32>) {
    %cast = memref.cast %arg0 : memref<42x?xf32> to memref<?x1xf32>
    return
  }
}