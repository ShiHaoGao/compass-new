module {
  func.func @split_at(%arg0: tensor<?xindex>, %arg1: index) -> (tensor<?xindex>, tensor<?xindex>) {
    %head, %tail = "shape.split_at"(%arg0, %arg1) : (tensor<?xindex>, index) -> (tensor<?xindex>, tensor<?xindex>)
    return %head, %tail : tensor<?xindex>, tensor<?xindex>
  }
}