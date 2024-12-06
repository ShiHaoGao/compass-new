module {
  func.func @complex_tanh(%arg0: complex<f32>) -> complex<f32> {
    %0 = complex.tanh %arg0 : complex<f32>
    return %0 : complex<f32>
  }
}