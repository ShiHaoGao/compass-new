module {
  func.func @complex_sub(%arg0: complex<f32>, %arg1: complex<f32>) -> complex<f32> {
    %0 = complex.sub %arg0, %arg1 : complex<f32>
    return %0 : complex<f32>
  }
}