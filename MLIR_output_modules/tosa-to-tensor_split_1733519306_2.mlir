module {
  func.func @test_reshape_0d_same_s2s_explicit(%arg0: tensor<f32>) -> tensor<f32> {
    %0 = tosa.reshape %arg0 {new_shape = array<i64>} : (tensor<f32>) -> tensor<f32>
    return %0 : tensor<f32>
  }
}