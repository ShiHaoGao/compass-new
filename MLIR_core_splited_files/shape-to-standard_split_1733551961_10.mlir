module {
  func.func @const_shape_zero_elements() -> tensor<0xindex> {
    %0 = shape.const_shape [] : tensor<0xindex>
    return %0 : tensor<0xindex>
  }
}