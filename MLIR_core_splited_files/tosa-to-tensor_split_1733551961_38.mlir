module {
  func.func @pad_dyn_input(%arg0: tensor<?x2xf32>) -> tensor<?x9xf32> {
    %cst = arith.constant dense<[[1, 2], [3, 4]]> : tensor<2x2xi32>
    %0 = tosa.pad %arg0, %cst : (tensor<?x2xf32>, tensor<2x2xi32>) -> tensor<?x9xf32>
    return %0 : tensor<?x9xf32>
  }
  func.func @pad_dyn_padding(%arg0: tensor<1x2xf32>) -> tensor<?x9xf32> {
    %cst = arith.constant dense<[[-1, 2], [3, 4]]> : tensor<2x2xi32>
    %0 = tosa.pad %arg0, %cst : (tensor<1x2xf32>, tensor<2x2xi32>) -> tensor<?x9xf32>
    return %0 : tensor<?x9xf32>
  }
}