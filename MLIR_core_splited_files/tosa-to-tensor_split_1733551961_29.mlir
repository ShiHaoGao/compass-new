module {
  func.func @test_reshape_6d_down_d2d_auto(%arg0: tensor<1x2x?x5x7x11xf32>) -> tensor<?x5x77xf32> {
    %0 = tosa.reshape %arg0 {new_shape = array<i64: -1, 5, 77>} : (tensor<1x2x?x5x7x11xf32>) -> tensor<?x5x77xf32>
    return %0 : tensor<?x5x77xf32>
  }
}