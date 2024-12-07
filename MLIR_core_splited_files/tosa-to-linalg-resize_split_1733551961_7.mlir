module {
  func.func @broadcast_resize_bilinear_i8(%arg0: tensor<3x1x1x7xi8>) -> tensor<3x4x5x7xi32> {
    %0 = tosa.resize %arg0 {border = array<i64: 0, 0>, mode = "BILINEAR", offset = array<i64: 0, 0>, scale = array<i64: 2, 1, 3, 1>} : (tensor<3x1x1x7xi8>) -> tensor<3x4x5x7xi32>
    return %0 : tensor<3x4x5x7xi32>
  }
}