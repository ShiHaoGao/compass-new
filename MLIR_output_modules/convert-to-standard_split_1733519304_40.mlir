module {
  func.func @complex_sign_with_fmf(%arg0: complex<f32>) -> complex<f32> {
    %0 = complex.sign %arg0 fastmath<nnan,contract> : complex<f32>
    return %0 : complex<f32>
  }
}