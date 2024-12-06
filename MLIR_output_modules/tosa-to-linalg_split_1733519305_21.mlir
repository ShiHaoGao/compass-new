module {
  func.func @test_i64(%arg0: tensor<1xi64>) {
    %0 = tosa.clamp %arg0 {max_fp = 0.000000e+00 : f32, max_int = 9223372036854775807 : i64, min_fp = 0.000000e+00 : f32, min_int = -9223372036854775808 : i64} : (tensor<1xi64>) -> tensor<1xi64>
    return
  }
}