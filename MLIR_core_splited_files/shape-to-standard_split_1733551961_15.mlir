module {
  func.func @shape_of(%arg0: tensor<*xf32>) {
    %0 = shape.shape_of %arg0 : tensor<*xf32> -> !shape.shape
    return
  }
}