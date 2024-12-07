module {
  func.func @test_add_2d_different_ranks(%arg0: tensor<3x4xf32>, %arg1: tensor<2x3x4xf32>) -> tensor<2x3x4xf32> {
    %0 = tosa.add %arg0, %arg1 : (tensor<3x4xf32>, tensor<2x3x4xf32>) -> tensor<2x3x4xf32>
    return %0 : tensor<2x3x4xf32>
  }
}