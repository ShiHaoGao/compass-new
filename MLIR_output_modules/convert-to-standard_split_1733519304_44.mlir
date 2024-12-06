module {
  func.func @complex_angle_with_fmf(%arg0: complex<f32>) -> f32 {
    %0 = complex.angle %arg0 fastmath<nnan,contract> : complex<f32>
    return %0 : f32
  }
}