module {
  func.func @broadcast(%arg0: tensor<2xindex>, %arg1: tensor<3xindex>, %arg2: tensor<2xindex>) -> !shape.witness {
    %0 = shape.cstr_broadcastable %arg0, %arg1, %arg2 : tensor<2xindex>, tensor<3xindex>, tensor<2xindex>
    return %0 : !shape.witness
  }
}