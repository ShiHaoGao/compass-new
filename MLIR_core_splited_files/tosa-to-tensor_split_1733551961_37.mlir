module {
  func.func @pad_float_explicit(%arg0: tensor<1x2xf32>) -> tensor<4x9xf32> {
    %cst = arith.constant dense<[[1, 2], [3, 4]]> : tensor<2x2xi32>
    %cst_0 = arith.constant dense<4.200000e+01> : tensor<f32>
    %0 = tosa.pad %arg0, %cst, %cst_0 : (tensor<1x2xf32>, tensor<2x2xi32>, tensor<f32>) -> tensor<4x9xf32>
    return %0 : tensor<4x9xf32>
  }
}