module {
  func.func @try_is_broadcastable(%arg0: tensor<2xindex>, %arg1: tensor<3xindex>, %arg2: tensor<2xindex>) -> i1 {
    %0 = shape.is_broadcastable %arg0, %arg1, %arg2 : tensor<2xindex>, tensor<3xindex>, tensor<2xindex>
    return %0 : i1
  }
}