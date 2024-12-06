module {
  func.func @test_reshape_0d_up_s2d_explicit(%arg0: tensor<f32>) -> tensor<?xf32> {
    %0 = tosa.reshape %arg0 {new_shape = array<i64: 1>} : (tensor<f32>) -> tensor<?xf32>
    return %0 : tensor<?xf32>
  }
}