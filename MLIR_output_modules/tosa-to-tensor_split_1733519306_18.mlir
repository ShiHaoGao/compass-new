module {
  func.func @test_reshape_3d_same_d2d_auto(%arg0: tensor<2x?x?xf32>) -> tensor<?x?x?xf32> {
    %0 = tosa.reshape %arg0 {new_shape = array<i64: 2, -1, 4>} : (tensor<2x?x?xf32>) -> tensor<?x?x?xf32>
    return %0 : tensor<?x?x?xf32>
  }
}