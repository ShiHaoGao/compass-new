module {
  func.func @shape_of_stat(%arg0: tensor<1x2x3xf32>) {
    %0 = shape.shape_of %arg0 : tensor<1x2x3xf32> -> tensor<?xindex>
    return
  }
}