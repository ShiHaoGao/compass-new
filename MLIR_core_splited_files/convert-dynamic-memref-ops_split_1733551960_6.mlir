module {
  func.func @dynamic_dealloc(%arg0: memref<?x?xf32>) {
    memref.dealloc %arg0 : memref<?x?xf32>
    return
  }
}