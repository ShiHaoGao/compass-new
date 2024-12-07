module {
  func.func @resize_bilinear_int(%arg0: tensor<1x19x20x1xi8>) {
    %0 = tosa.resize %arg0 {border = array<i64: 0, 0>, mode = "BILINEAR", offset = array<i64: 0, 0>, scale = array<i64: 16, 1, 16, 1>} : (tensor<1x19x20x1xi8>) -> tensor<1x304x320x1xi48>
    return
  }
}