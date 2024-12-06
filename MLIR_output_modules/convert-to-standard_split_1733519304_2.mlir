module {
  func.func @complex_atan2(%arg0: complex<f32>, %arg1: complex<f32>) -> complex<f32> {
    %0 = complex.atan2 %arg0, %arg1 : complex<f32>
    return %0 : complex<f32>
  }
}