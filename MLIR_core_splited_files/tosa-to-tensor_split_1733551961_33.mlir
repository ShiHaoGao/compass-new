module {
  func.func @test_reshape_samerank_unsigned(%arg0: tensor<3x2xui8>) -> tensor<2x3xui8> {
    %0 = tosa.reshape %arg0 {new_shape = array<i64: 2, 3>} : (tensor<3x2xui8>) -> tensor<2x3xui8>
    return %0 : tensor<2x3xui8>
  }
}