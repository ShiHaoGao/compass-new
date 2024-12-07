module {
  func.func @matmul_dyn_batch(%arg0: tensor<?x5x3xf32>, %arg1: tensor<?x3x6xf32>) -> tensor<?x5x6xf32> {
    %0 = tosa.matmul %arg0, %arg1 : (tensor<?x5x3xf32>, tensor<?x3x6xf32>) -> tensor<?x5x6xf32>
    return %0 : tensor<?x5x6xf32>
  }
}