module {
  func.func @scatter_test(%arg0: tensor<3x7x5xi32>, %arg1: tensor<3x6xi32>, %arg2: tensor<3x6x5xi32>) -> tensor<3x7x5xi32> {
    %0 = tosa.scatter %arg0, %arg1, %arg2 : (tensor<3x7x5xi32>, tensor<3x6xi32>, tensor<3x6x5xi32>) -> tensor<3x7x5xi32>
    return %0 : tensor<3x7x5xi32>
  }
}