module {
  func.func @rescale_per_channel(%arg0: tensor<3xi8>) -> tensor<3xi8> {
    %0 = tosa.rescale %arg0 {double_round = false, input_zp = 243 : i32, multiplier = array<i32: 42, 43, 44>, output_zp = 252 : i32, per_channel = false, scale32 = false, shift = array<i8: 14, 15, 64>} : (tensor<3xi8>) -> tensor<3xi8>
    return %0 : tensor<3xi8>
  }
}