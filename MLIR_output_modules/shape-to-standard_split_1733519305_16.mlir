module {
  func.func @shape_of_unranked(%arg0: tensor<*xf32>) {
    %0 = shape.shape_of %arg0 : tensor<*xf32> -> tensor<?xindex>
    return
  }
}