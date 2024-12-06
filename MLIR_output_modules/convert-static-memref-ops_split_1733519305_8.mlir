module {
  func.func @zero_d_load(%arg0: memref<f32>) -> f32 {
    %0 = memref.load %arg0[] : memref<f32>
    return %0 : f32
  }
}