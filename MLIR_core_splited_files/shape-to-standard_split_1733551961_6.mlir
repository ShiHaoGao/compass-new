module {
  func.func @dim(%arg0: tensor<2x3xf32>, %arg1: index) -> index {
    %0 = shape.dim %arg0, %arg1 : tensor<2x3xf32>, index -> index
    return %0 : index
  }
}