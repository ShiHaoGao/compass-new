module {
  func.func @conv2d_f32(%arg0: tensor<1x49x42x27xf32>, %arg1: tensor<28x3x3x27xf32>, %arg2: tensor<28xf32>) {
    %0 = tosa.conv2d %arg0, %arg1, %arg2 {dilation = array<i64: 2, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x49x42x27xf32>, tensor<28x3x3x27xf32>, tensor<28xf32>) -> tensor<1x45x40x28xf32>
    return
  }
}