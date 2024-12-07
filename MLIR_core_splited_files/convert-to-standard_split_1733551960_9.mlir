module {
  func.func @complex_log(%arg0: complex<f32>) -> complex<f32> {
    %0 = complex.log %arg0 : complex<f32>
    return %0 : complex<f32>
  }
}