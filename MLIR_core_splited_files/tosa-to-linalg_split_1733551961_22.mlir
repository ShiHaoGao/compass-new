module {
  func.func @test_clamp_f16(%arg0: tensor<1xf16>) {
    %0 = tosa.clamp %arg0 {max_fp = 6.000000e+00 : f32, max_int = 0 : i64, min_fp = 0.000000e+00 : f32, min_int = 0 : i64} : (tensor<1xf16>) -> tensor<1xf16>
    return
  }
}