module {
  func.func @test_reshape_2d_down_s2s_explicit(%arg0: tensor<2x3xf32>) -> tensor<6xf32> {
    %0 = tosa.reshape %arg0 {new_shape = array<i64: 6>} : (tensor<2x3xf32>) -> tensor<6xf32>
    return %0 : tensor<6xf32>
  }
}