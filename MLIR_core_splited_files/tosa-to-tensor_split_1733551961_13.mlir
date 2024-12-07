module {
  func.func @test_reshape_2d_same_d2d_auto(%arg0: tensor<?x2xf32>) -> tensor<2x?xf32> {
    %0 = tosa.reshape %arg0 {new_shape = array<i64: 2, -1>} : (tensor<?x2xf32>) -> tensor<2x?xf32>
    return %0 : tensor<2x?xf32>
  }
}