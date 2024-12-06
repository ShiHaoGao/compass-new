module {
  func.func @unary_resize_bilinear_fp16(%arg0: tensor<3x1x1x7xf16>) -> tensor<3x1x1x7xf16> {
    %0 = tosa.resize %arg0 {border = array<i64: 0, 0>, mode = "BILINEAR", offset = array<i64: 0, 0>, scale = array<i64: 2, 2, 1, 1>} : (tensor<3x1x1x7xf16>) -> tensor<3x1x1x7xf16>
    return %0 : tensor<3x1x1x7xf16>
  }
}