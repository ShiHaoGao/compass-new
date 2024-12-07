module {
  func.func @any_of_three(%arg0: tensor<?xindex>, %arg1: tensor<?xindex>, %arg2: tensor<?xindex>) -> tensor<?xindex> {
    %0 = shape.any %arg0, %arg1, %arg2 : tensor<?xindex>, tensor<?xindex>, tensor<?xindex> -> tensor<?xindex>
    return %0 : tensor<?xindex>
  }
}