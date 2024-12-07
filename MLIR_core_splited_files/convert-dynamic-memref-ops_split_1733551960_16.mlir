module {
  func.func @memref_cast_dynamic_to_static(%arg0: memref<?x?xf32>) {
    %cast = memref.cast %arg0 : memref<?x?xf32> to memref<10x12xf32>
    return
  }
}