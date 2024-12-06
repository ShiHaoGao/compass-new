module {
  func.func @conv2d_dyn_output(%arg0: tensor<2x6x5x4xf32>, %arg1: tensor<4x3x3x4xf32>, %arg2: tensor<4xf32>) {
    %0 = tosa.conv2d %arg0, %arg1, %arg2 {dilation = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<2x6x5x4xf32>, tensor<4x3x3x4xf32>, tensor<4xf32>) -> tensor<?x4x3x4xf32>
    return
  }
}