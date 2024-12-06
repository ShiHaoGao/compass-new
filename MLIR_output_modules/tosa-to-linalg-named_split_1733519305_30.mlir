module {
  func.func @conv3d_scalar_bias_f32(%arg0: tensor<1x49x48x47x27xf32>, %arg1: tensor<28x3x4x5x27xf32>, %arg2: tensor<1xf32>) {
    %0 = tosa.conv3d %arg0, %arg1, %arg2 {dilation = array<i64: 1, 1, 1>, pad = array<i64: 0, 0, 0, 0, 0, 0>, stride = array<i64: 1, 1, 1>} : (tensor<1x49x48x47x27xf32>, tensor<28x3x4x5x27xf32>, tensor<1xf32>) -> tensor<1x47x45x43x28xf32>
    return
  }
}