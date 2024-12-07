module {
  func.func @rescaleDoubleRound(%arg0: tensor<2xi8>) -> tensor<2xi8> {
    %0 = tosa.rescale %arg0 {double_round = true, input_zp = 243 : i32, multiplier = array<i32: 19689>, output_zp = 252 : i32, per_channel = false, scale32 = true, shift = array<i8: 33>} : (tensor<2xi8>) -> tensor<2xi8>
    return %0 : tensor<2xi8>
  }
  func.func @rescaleUnnecessaryDoubleRound(%arg0: tensor<2xi8>) -> tensor<2xi8> {
    %0 = tosa.rescale %arg0 {double_round = true, input_zp = 243 : i32, multiplier = array<i32: 19689>, output_zp = 252 : i32, per_channel = false, scale32 = true, shift = array<i8: 15>} : (tensor<2xi8>) -> tensor<2xi8>
    return %0 : tensor<2xi8>
  }
}