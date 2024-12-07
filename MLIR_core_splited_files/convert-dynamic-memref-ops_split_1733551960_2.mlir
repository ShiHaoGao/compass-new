module {
  func.func @mixed_dealloc(%arg0: memref<?x42x?xf32>) {
    memref.dealloc %arg0 : memref<?x42x?xf32>
    return
  }
}