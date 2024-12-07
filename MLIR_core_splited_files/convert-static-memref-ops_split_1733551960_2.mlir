module {
  func.func @zero_d_dealloc(%arg0: memref<f32>) {
    memref.dealloc %arg0 : memref<f32>
    return
  }
}