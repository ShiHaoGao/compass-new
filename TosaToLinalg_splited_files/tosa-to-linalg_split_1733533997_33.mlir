module {
  func.func @rescale_i8(%arg0: tensor<2xi8>) {
    %0 = tosa.rescale %arg0 {double_round = false, input_zp = 17 : i32, multiplier = array<i32: 19689>, output_zp = 22 : i32, per_channel = false, scale32 = false, shift = array<i8: 15>} : (tensor<2xi8>) -> tensor<2xi8>
    %1 = tosa.rescale %arg0 {double_round = false, input_zp = 17 : i32, multiplier = array<i32: 19689>, output_zp = 22 : i32, per_channel = false, scale32 = false, shift = array<i8: 15>} : (tensor<2xi8>) -> tensor<2xui8>
    return
  }
}