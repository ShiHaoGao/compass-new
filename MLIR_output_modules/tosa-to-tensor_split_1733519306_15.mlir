module {
  func.func @test_reshape_2d_same_s2d_explicit(%arg0: tensor<2x4xf32>) -> tensor<?x2xf32> {
    %0 = tosa.reshape %arg0 {new_shape = array<i64: 4, 2>} : (tensor<2x4xf32>) -> tensor<?x2xf32>
    return %0 : tensor<?x2xf32>
  }
}