module {
  func.func @resize_nearest_int(%arg0: tensor<1x15x13x1xi8>) {
    %0 = tosa.resize %arg0 {border = array<i64: 0, 0>, mode = "NEAREST_NEIGHBOR", offset = array<i64: 0, 0>, scale = array<i64: 11, 7, 89, 6>} : (tensor<1x15x13x1xi8>) -> tensor<1x23x179x1xi8>
    return
  }
}