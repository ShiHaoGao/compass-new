module {
  func.func @shape_eq(%arg0: tensor<?xindex>, %arg1: tensor<?xindex>) -> i1 {
    %0 = shape.shape_eq %arg0, %arg1 : tensor<?xindex>, tensor<?xindex>
    return %0 : i1
  }
}