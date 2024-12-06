module {
  func.func @any_of_one(%arg0: tensor<?xindex>) -> tensor<?xindex> {
    %0 = shape.any %arg0 : tensor<?xindex> -> tensor<?xindex>
    return %0 : tensor<?xindex>
  }
}