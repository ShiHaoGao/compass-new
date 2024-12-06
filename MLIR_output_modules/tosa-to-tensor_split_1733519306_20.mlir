module {
  func.func @test_reshape_3d_same_d2d_explicit_empty(%arg0: tensor<3x2x?xf32>) -> tensor<?x?x?xf32> {
    %0 = tosa.reshape %arg0 {new_shape = array<i64: 0, 3, 2>} : (tensor<3x2x?xf32>) -> tensor<?x?x?xf32>
    return %0 : tensor<?x?x?xf32>
  }
}