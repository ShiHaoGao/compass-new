module {
  func.func @complex_abs_with_fmf(%arg0: complex<f32>) -> f32 {
    %0 = complex.abs %arg0 fastmath<nnan,contract> : complex<f32>
    return %0 : f32
  }
}