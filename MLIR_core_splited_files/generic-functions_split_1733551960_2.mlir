module {
  func.func @dealloc(%arg0: memref<f32>) {
    memref.dealloc %arg0 : memref<f32>
    return
  }
}