module {
  func.func @complex_sqrt(%arg0: complex<f32>) -> complex<f32> {
    %0 = complex.sqrt %arg0 : complex<f32>
    return %0 : complex<f32>
  }
}