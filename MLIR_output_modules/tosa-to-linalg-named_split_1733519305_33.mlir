module {
  func.func @test_transpose_dyn(%arg0: tensor<1x?x3x4xi32>) {
    %cst = arith.constant dense<[1, 3, 0, 2]> : tensor<4xi32>
    %0 = tosa.transpose %arg0, %cst : (tensor<1x?x3x4xi32>, tensor<4xi32>) -> tensor<?x4x1x3xi32>
    return
  }
}