module {
  func.func @get_extent_from_extent_tensor(%arg0: tensor<?xindex>, %arg1: index) -> index {
    %0 = shape.get_extent %arg0, %arg1 : tensor<?xindex>, index -> index
    return %0 : index
  }
}