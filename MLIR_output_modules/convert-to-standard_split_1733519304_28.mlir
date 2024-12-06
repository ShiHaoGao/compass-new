module {
  func.func @complex_add_with_fmf(%arg0: complex<f32>, %arg1: complex<f32>) -> complex<f32> {
    %0 = complex.add %arg0, %arg1 fastmath<nnan,contract> : complex<f32>
    return %0 : complex<f32>
  }
}