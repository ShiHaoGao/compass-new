module {
  func.func @resize_bilinear_fp(%arg0: tensor<1x23x24x1xf32>) {
    %0 = tosa.resize %arg0 {border = array<i64: 0, 0>, mode = "BILINEAR", offset = array<i64: 0, 0>, scale = array<i64: 4, 1, 4, 1>} : (tensor<1x23x24x1xf32>) -> tensor<1x92x96x1xf32>
    return
  }
}