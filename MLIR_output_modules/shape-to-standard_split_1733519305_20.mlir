module {
  func.func @shape_of_dyn(%arg0: tensor<1x5x?xf32>) {
    %0 = shape.shape_of %arg0 : tensor<1x5x?xf32> -> tensor<?xindex>
    return
  }
}