module {
  func.func @broadcast(%arg0: tensor<?xindex>, %arg1: !shape.shape) -> !shape.shape {
    %0 = shape.broadcast %arg0, %arg1 : tensor<?xindex>, !shape.shape -> !shape.shape
    return %0 : !shape.shape
  }
}