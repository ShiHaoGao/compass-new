module {
  func.func @get_extent(%arg0: tensor<?xindex>, %arg1: !shape.size) -> !shape.size {
    %0 = shape.get_extent %arg0, %arg1 : tensor<?xindex>, !shape.size -> !shape.size
    return %0 : !shape.size
  }
}