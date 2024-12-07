module {
  func.func @rank(%arg0: !shape.shape) {
    %0 = shape.rank %arg0 : !shape.shape -> !shape.size
    return
  }
}