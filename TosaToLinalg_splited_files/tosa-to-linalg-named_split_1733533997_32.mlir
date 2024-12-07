module {
  func.func @test_transpose(%arg0: tensor<1x2x3xi32>) {
    %cst = arith.constant dense<[1, 2, 0]> : tensor<3xi32>
    %0 = tosa.transpose %arg0, %cst : (tensor<1x2x3xi32>, tensor<3xi32>) -> tensor<2x3x1xi32>
    return
  }
}