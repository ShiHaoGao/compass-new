module {
  func.func @broadcast_to_known_rank(%arg0: tensor<1xindex>, %arg1: tensor<3xindex>) -> tensor<3xindex> {
    %0 = shape.broadcast %arg0, %arg1 : tensor<1xindex>, tensor<3xindex> -> tensor<3xindex>
    return %0 : tensor<3xindex>
  }
}