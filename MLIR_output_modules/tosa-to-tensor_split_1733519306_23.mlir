module {
  func.func @test_reshape_3d_same_d2s_auto(%arg0: tensor<?x?x?xf32>) -> tensor<2x3x4xf32> {
    %0 = tosa.reshape %arg0 {new_shape = array<i64: 2, -1, 4>} : (tensor<?x?x?xf32>) -> tensor<2x3x4xf32>
    return %0 : tensor<2x3x4xf32>
  }
}