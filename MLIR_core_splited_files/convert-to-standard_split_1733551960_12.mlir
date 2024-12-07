module {
  func.func @complex_neg(%arg0: complex<f32>) -> complex<f32> {
    %0 = complex.neg %arg0 : complex<f32>
    return %0 : complex<f32>
  }
}