module {
  func.func @matmul_dyn_output(%arg0: tensor<1x1x8xf32>, %arg1: tensor<1x8x1xf32>) -> tensor<?x1x1xf32> {
    %0 = tosa.matmul %arg0, %arg1 : (tensor<1x1x8xf32>, tensor<1x8x1xf32>) -> tensor<?x1x1xf32>
    return %0 : tensor<?x1x1xf32>
  }
}