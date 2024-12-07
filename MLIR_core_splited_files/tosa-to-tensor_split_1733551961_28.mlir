module {
  func.func @test_reshape_5d_down_d2d_auto(%arg0: tensor<?x?x?x2x3xf32>) -> tensor<?x2x3xf32> {
    %0 = tosa.reshape %arg0 {new_shape = array<i64: -1, 2, 3>} : (tensor<?x?x?x2x3xf32>) -> tensor<?x2x3xf32>
    return %0 : tensor<?x2x3xf32>
  }
}