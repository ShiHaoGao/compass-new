module {
  func.func @test_reshape_3d_same_d2d_explicit_identity(%arg0: tensor<?x3x4xf32>) -> tensor<2x3x?xf32> {
    %0 = tosa.reshape %arg0 {new_shape = array<i64: 2, 3, 4>} : (tensor<?x3x4xf32>) -> tensor<2x3x?xf32>
    return %0 : tensor<2x3x?xf32>
  }
}