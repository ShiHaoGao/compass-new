module {
  func.func @memref_cast_mixed_to_static(%arg0: memref<42x?xf32>) {
    %cast = memref.cast %arg0 : memref<42x?xf32> to memref<42x1xf32>
    return
  }
}