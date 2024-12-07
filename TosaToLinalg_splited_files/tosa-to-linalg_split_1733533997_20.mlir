module {
  func.func @test_i8(%arg0: tensor<1xi8>) {
    %0 = tosa.clamp %arg0 {max_fp = 0.000000e+00 : f32, max_int = 126 : i64, min_fp = 0.000000e+00 : f32, min_int = -127 : i64} : (tensor<1xi8>) -> tensor<1xi8>
    %1 = tosa.clamp %arg0 {max_fp = 0.000000e+00 : f32, max_int = 130 : i64, min_fp = 0.000000e+00 : f32, min_int = -130 : i64} : (tensor<1xi8>) -> tensor<1xi8>
    return
  }
}