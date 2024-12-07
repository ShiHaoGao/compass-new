module {
  func.func @test_transpose_dyn_multiple_2d(%arg0: tensor<?x?xf32>) {
    %cst = arith.constant dense<[1, 0]> : tensor<2xi32>
    %0 = tosa.transpose %arg0, %cst : (tensor<?x?xf32>, tensor<2xi32>) -> tensor<?x?xf32>
    return
  }
}