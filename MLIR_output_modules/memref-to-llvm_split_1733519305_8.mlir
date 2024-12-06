module {
  func.func @transpose(%arg0: memref<?x?x?xf32, strided<[?, ?, 1], offset: ?>>) {
    %transpose = memref.transpose %arg0 (d0, d1, d2) -> (d2, d0, d1) : memref<?x?x?xf32, strided<[?, ?, 1], offset: ?>> to memref<?x?x?xf32, strided<[1, ?, ?], offset: ?>>
    return
  }
}