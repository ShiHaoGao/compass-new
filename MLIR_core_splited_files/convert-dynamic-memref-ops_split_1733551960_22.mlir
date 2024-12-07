module {
  func.func @memref_cast_unranked_to_ranked(%arg0: memref<*xf32>) {
    %cast = memref.cast %arg0 : memref<*xf32> to memref<?x?x10x2xf32>
    return
  }
}