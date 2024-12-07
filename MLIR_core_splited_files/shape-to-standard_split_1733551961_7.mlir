module {
  func.func @get_extent_shape_of(%arg0: tensor<2x3xf32>, %arg1: index) -> index {
    %0 = shape.shape_of %arg0 : tensor<2x3xf32> -> tensor<?xindex>
    %1 = shape.get_extent %0, %arg1 : tensor<?xindex>, index -> index
    return %1 : index
  }
}