module {
  func.func @test_transpose_dyn_multiple_3d(%arg0: tensor<?x?x?xf32>) {
    %cst = arith.constant dense<[2, 0, 1]> : tensor<3xi32>
    %0 = tosa.transpose %arg0, %cst : (tensor<?x?x?xf32>, tensor<3xi32>) -> tensor<?x?x?xf32>
    return
  }
}