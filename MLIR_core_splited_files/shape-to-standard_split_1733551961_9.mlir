module {
  func.func @const_shape() -> tensor<3xindex> {
    %0 = shape.const_shape [1, 2, 3] : tensor<3xindex>
    return %0 : tensor<3xindex>
  }
}