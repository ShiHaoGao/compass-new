module {
  func.func @fully_connected_dyn(%arg0: tensor<?x3xf32>, %arg1: tensor<6x3xf32>, %arg2: tensor<6xf32>) -> tensor<?x6xf32> {
    %0 = tosa.fully_connected %arg0, %arg1, %arg2 : (tensor<?x3xf32>, tensor<6x3xf32>, tensor<6xf32>) -> tensor<?x6xf32>
    return %0 : tensor<?x6xf32>
  }
}