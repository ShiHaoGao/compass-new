module {
  func.func @test_reshape_2d_down_d2d_auto(%arg0: tensor<2x?xf32>) -> tensor<?xf32> {
    %0 = tosa.reshape %arg0 {new_shape = array<i64: -1>} : (tensor<2x?xf32>) -> tensor<?xf32>
    return %0 : tensor<?xf32>
  }
}