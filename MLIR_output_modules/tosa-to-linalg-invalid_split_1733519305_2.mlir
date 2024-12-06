module {
  func.func @tensor_with_unknown_rank(%arg0: tensor<*xi8>) -> tensor<*xi8> {
    %0 = tosa.abs %arg0 : (tensor<*xi8>) -> tensor<*xi8>
    return %0 : tensor<*xi8>
  }
}