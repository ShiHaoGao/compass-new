module {
  func.func @complex_add(%arg0: complex<f32>, %arg1: complex<f32>) -> complex<f32> {
    %0 = complex.add %arg0, %arg1 : complex<f32>
    return %0 : complex<f32>
  }
}