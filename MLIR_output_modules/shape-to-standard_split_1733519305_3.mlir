module {
  func.func @rank(%arg0: tensor<?xindex>) -> index {
    %0 = shape.rank %arg0 : tensor<?xindex> -> index
    return %0 : index
  }
}