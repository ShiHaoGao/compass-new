module {
  func.func @memref_cast_ranked_to_unranked(%arg0: memref<42x2x?xf32>) {
    %cast = memref.cast %arg0 : memref<42x2x?xf32> to memref<*xf32>
    return
  }
}