module {
  func.func @test_reshape_2d_same_s2s_explicit(%arg0: tensor<3x2xf32>) -> tensor<2x3xf32> {
    %0 = tosa.reshape %arg0 {new_shape = array<i64: 2, 3>} : (tensor<3x2xf32>) -> tensor<2x3xf32>
    return %0 : tensor<2x3xf32>
  }
}