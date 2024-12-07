module {
  func.func @fully_connected(%arg0: tensor<5x3xf32>, %arg1: tensor<6x3xf32>, %arg2: tensor<6xf32>) -> tensor<5x6xf32> {
    %0 = tosa.fully_connected %arg0, %arg1, %arg2 : (tensor<5x3xf32>, tensor<6x3xf32>, tensor<6xf32>) -> tensor<5x6xf32>
    return %0 : tensor<5x6xf32>
  }
}