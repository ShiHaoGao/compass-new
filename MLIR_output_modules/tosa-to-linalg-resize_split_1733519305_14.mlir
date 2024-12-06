module {
  func.func @resize_bilinear_int48(%arg0: tensor<1x19x19x1xi16>) {
    %0 = tosa.resize %arg0 {border = array<i64: 0, 0>, mode = "BILINEAR", offset = array<i64: 0, 0>, scale = array<i64: 16, 1, 16, 1>} : (tensor<1x19x19x1xi16>) -> tensor<1x289x289x1xi48>
    return
  }
}