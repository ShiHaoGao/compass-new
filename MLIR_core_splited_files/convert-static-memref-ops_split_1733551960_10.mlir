module {
  func.func @zero_d_store(%arg0: memref<f32>, %arg1: f32) {
    memref.store %arg1, %arg0[] : memref<f32>
    return
  }
}