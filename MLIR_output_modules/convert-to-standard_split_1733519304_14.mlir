module {
  func.func @complex_sin(%arg0: complex<f32>) -> complex<f32> {
    %0 = complex.sin %arg0 : complex<f32>
    return %0 : complex<f32>
  }
}