module {
  func.func @memref_cast_mixed_to_dynamic(%arg0: memref<42x?xf32>) {
    %cast = memref.cast %arg0 : memref<42x?xf32> to memref<?x?xf32>
    return
  }
}