module {
  func.func @test_reshape_4d_down_d2s_explicit(%arg0: tensor<?x?x?x?xf32>) -> tensor<f32> {
    %0 = tosa.reshape %arg0 {new_shape = array<i64>} : (tensor<?x?x?x?xf32>) -> tensor<f32>
    return %0 : tensor<f32>
  }
}