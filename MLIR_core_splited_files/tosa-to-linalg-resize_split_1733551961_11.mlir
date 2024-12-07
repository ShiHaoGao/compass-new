module {
  func.func @resize_nearest_fp32(%arg0: tensor<1x50x48x1xf32>) {
    %0 = tosa.resize %arg0 {border = array<i64: 31, 31>, mode = "NEAREST_NEIGHBOR", offset = array<i64: -31, -31>, scale = array<i64: 64, 2, 64, 2>} : (tensor<1x50x48x1xf32>) -> tensor<1x1600x1536x1xf32>
    return
  }
}