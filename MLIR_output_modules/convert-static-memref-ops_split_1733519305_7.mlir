module {
  func.func @static_dealloc(%arg0: memref<10x8xf32>) {
    memref.dealloc %arg0 : memref<10x8xf32>
    return
  }
}