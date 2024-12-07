module {
  func.func @resize_dyn(%arg0: tensor<?x2x2x1xi8>) {
    %0 = tosa.resize %arg0 {border = array<i64: 1, 1>, mode = "BILINEAR", offset = array<i64: -1, -1>, scale = array<i64: 4, 2, 4, 2>} : (tensor<?x2x2x1xi8>) -> tensor<?x4x4x1xi32>
    return
  }
}