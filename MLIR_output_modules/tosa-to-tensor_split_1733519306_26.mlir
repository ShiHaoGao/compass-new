module {
  func.func @test_reshape_3d_up_d2s_explicit(%arg0: tensor<?x?x?xf32>) -> tensor<1x3x2x1xf32> {
    %0 = tosa.reshape %arg0 {new_shape = array<i64: 1, 3, 2, 1>} : (tensor<?x?x?xf32>) -> tensor<1x3x2x1xf32>
    return %0 : tensor<1x3x2x1xf32>
  }
}