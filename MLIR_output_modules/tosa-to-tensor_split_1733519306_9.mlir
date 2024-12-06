module {
  func.func @test_reshape_1d_up_d2d_auto(%arg0: tensor<?xf32>) -> tensor<2x?xf32> {
    %0 = tosa.reshape %arg0 {new_shape = array<i64: 2, -1>} : (tensor<?xf32>) -> tensor<2x?xf32>
    return %0 : tensor<2x?xf32>
  }
}