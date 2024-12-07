module {
  func.func @complex_rsqrt_nnan_ninf(%arg0: complex<f32>) -> complex<f32> {
    %0 = complex.rsqrt %arg0 fastmath<nnan,ninf> : complex<f32>
    return %0 : complex<f32>
  }
}