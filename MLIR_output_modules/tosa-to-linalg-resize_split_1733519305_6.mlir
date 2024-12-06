module {
  func.func @broadcast_resize_nearest_f32(%arg0: tensor<3x1x1x7xf32>) -> tensor<3x1x5x7xf32> {
    %0 = tosa.resize %arg0 {border = array<i64: 0, 0>, mode = "NEAREST_NEIGHBOR", offset = array<i64: 0, 0>, scale = array<i64: 2, 1, 3, 1>} : (tensor<3x1x1x7xf32>) -> tensor<3x1x5x7xf32>
    return %0 : tensor<3x1x5x7xf32>
  }
}