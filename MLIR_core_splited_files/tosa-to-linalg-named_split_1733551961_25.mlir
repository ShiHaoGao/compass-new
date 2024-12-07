module {
  func.func @depthwise_conv_dyn(%arg0: tensor<?x7x5x3xf32>, %arg1: tensor<3x1x3x11xf32>, %arg2: tensor<33xf32>) {
    %0 = tosa.depthwise_conv2d %arg0, %arg1, %arg2 {dilation = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<?x7x5x3xf32>, tensor<3x1x3x11xf32>, tensor<33xf32>) -> tensor<?x5x5x33xf32>
    return
  }
}