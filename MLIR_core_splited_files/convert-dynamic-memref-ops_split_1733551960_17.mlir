module {
  func.func @memref_cast_dynamic_to_mixed(%arg0: memref<?x?xf32>) {
    %cast = memref.cast %arg0 : memref<?x?xf32> to memref<?x12xf32>
    return
  }
}