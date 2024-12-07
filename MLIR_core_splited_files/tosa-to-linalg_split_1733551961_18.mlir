module {
  func.func @test_simple_i32(%arg0: tensor<1xi32>, %arg1: tensor<1xui32>, %arg2: tensor<1xui64>) {
    %0 = tosa.add %arg0, %arg0 : (tensor<1xi32>, tensor<1xi32>) -> tensor<1xi32>
    %1 = tosa.sub %arg0, %arg0 : (tensor<1xi32>, tensor<1xi32>) -> tensor<1xi32>
    %2 = tosa.mul %arg0, %arg0 {shift = 0 : i8} : (tensor<1xi32>, tensor<1xi32>) -> tensor<1xi32>
    %3 = tosa.mul %arg0, %arg0 {shift = 2 : i8} : (tensor<1xi32>, tensor<1xi32>) -> tensor<1xi32>
    %4 = tosa.int_div %arg0, %arg0 : (tensor<1xi32>, tensor<1xi32>) -> tensor<1xi32>
    %5 = tosa.negate %arg0 : (tensor<1xi32>) -> tensor<1xi32>
    %6 = tosa.bitwise_and %arg0, %arg0 : (tensor<1xi32>, tensor<1xi32>) -> tensor<1xi32>
    %7 = tosa.bitwise_or %arg0, %arg0 : (tensor<1xi32>, tensor<1xi32>) -> tensor<1xi32>
    %8 = tosa.bitwise_xor %arg0, %arg0 : (tensor<1xi32>, tensor<1xi32>) -> tensor<1xi32>
    %9 = tosa.logical_left_shift %arg0, %arg0 : (tensor<1xi32>, tensor<1xi32>) -> tensor<1xi32>
    %10 = tosa.logical_right_shift %arg0, %arg0 : (tensor<1xi32>, tensor<1xi32>) -> tensor<1xi32>
    %11 = tosa.arithmetic_right_shift %arg0, %arg0 {round = false} : (tensor<1xi32>, tensor<1xi32>) -> tensor<1xi32>
    %12 = tosa.arithmetic_right_shift %arg0, %arg0 {round = true} : (tensor<1xi32>, tensor<1xi32>) -> tensor<1xi32>
    %13 = tosa.clz %arg0 : (tensor<1xi32>) -> tensor<1xi32>
    %14 = tosa.greater %0, %1 : (tensor<1xi32>, tensor<1xi32>) -> tensor<1xi1>
    %15 = tosa.greater_equal %0, %1 : (tensor<1xi32>, tensor<1xi32>) -> tensor<1xi1>
    %16 = tosa.select %14, %0, %1 : (tensor<1xi1>, tensor<1xi32>, tensor<1xi32>) -> tensor<1xi32>
    %17 = tosa.maximum %0, %1 : (tensor<1xi32>, tensor<1xi32>) -> tensor<1xi32>
    %18 = tosa.minimum %0, %1 : (tensor<1xi32>, tensor<1xi32>) -> tensor<1xi32>
    %19 = tosa.clamp %0 {max_fp = 5.000000e+00 : f32, max_int = 5 : i64, min_fp = 1.000000e+00 : f32, min_int = 1 : i64} : (tensor<1xi32>) -> tensor<1xi32>
    %20 = tosa.clamp %arg1 {max_fp = 5.000000e+00 : f32, max_int = 32 : i64, min_fp = 1.000000e+00 : f32, min_int = 4 : i64} : (tensor<1xui32>) -> tensor<1xui32>
    %21 = tosa.clamp %arg1 {max_fp = 5.000000e+00 : f32, max_int = 9223372036854775807 : i64, min_fp = 1.000000e+00 : f32, min_int = 9223372036854775807 : i64} : (tensor<1xui32>) -> tensor<1xui32>
    %22 = tosa.clamp %arg1 {max_fp = 5.000000e+00 : f32, max_int = -2 : i64, min_fp = 1.000000e+00 : f32, min_int = -3 : i64} : (tensor<1xui32>) -> tensor<1xui32>
    %23 = tosa.clamp %arg2 {max_fp = 5.000000e+00 : f32, max_int = 9223372036854775807 : i64, min_fp = 1.000000e+00 : f32, min_int = -3 : i64} : (tensor<1xui64>) -> tensor<1xui64>
    %24 = tosa.cast %0 : (tensor<1xi32>) -> tensor<1xi16>
    %25 = tosa.cast %0 : (tensor<1xi32>) -> tensor<1xi64>
    %26 = tosa.cast %0 : (tensor<1xi32>) -> tensor<1xi1>
    %27 = tosa.cast %0 : (tensor<1xi32>) -> tensor<1xf32>
    %28 = tosa.abs %arg0 : (tensor<1xi32>) -> tensor<1xi32>
    return
  }
}