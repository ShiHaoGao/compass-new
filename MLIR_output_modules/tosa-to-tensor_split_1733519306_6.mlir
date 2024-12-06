module {
  func.func @test_reshape_0d_up_s2s_explicit(%arg0: tensor<f32>) -> tensor<1xf32> {
    %0 = tosa.reshape %arg0 {new_shape = array<i64: 1>} : (tensor<f32>) -> tensor<1xf32>
    return %0 : tensor<1xf32>
  }
}