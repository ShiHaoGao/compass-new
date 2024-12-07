module {
  func.func @broadcast_3_shapes_different_extents(%arg0: tensor<2xindex>, %arg1: tensor<3xindex>, %arg2: tensor<2xindex>) {
    %0 = shape.broadcast %arg0, %arg1, %arg2 : tensor<2xindex>, tensor<3xindex>, tensor<2xindex> -> tensor<?xindex>
    return
  }
}