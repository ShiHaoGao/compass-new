module {
  func.func @to_extent_tensor(%arg0: tensor<?xindex>) -> tensor<3xindex> {
    %0 = shape.to_extent_tensor %arg0 : tensor<?xindex> -> tensor<3xindex>
    return %0 : tensor<3xindex>
  }
  func.func @shape_reduce(%arg0: tensor<?xindex>) -> index {
    %c1 = arith.constant 1 : index
    %0 = shape.reduce(%arg0, %c1) : tensor<?xindex> -> index {
    ^bb0(%arg1: index, %arg2: index, %arg3: index):
      %1 = arith.muli %arg3, %arg2 : index
      shape.yield %1 : index
    }
    return %0 : index
  }
}