module {
  func.func @memref_cast_static_to_dynamic(%arg0: memref<10x42xf32>) {
    %cast = memref.cast %arg0 : memref<10x42xf32> to memref<?x?xf32>
    return
  }
}