module {
  func.func @test_reshape_6d_down_s2s_explicit(%arg0: tensor<1x2x3x5x7x11xf32>) -> tensor<6x5x77xf32> {
    %0 = tosa.reshape %arg0 {new_shape = array<i64: 6, 5, 77>} : (tensor<1x2x3x5x7x11xf32>) -> tensor<6x5x77xf32>
    return %0 : tensor<6x5x77xf32>
  }
}