module {
  func.func @unranked_dealloc(%arg0: memref<*xf32>) {
    memref.dealloc %arg0 : memref<*xf32>
    return
  }
}