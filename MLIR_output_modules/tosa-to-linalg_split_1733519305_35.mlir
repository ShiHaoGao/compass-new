module {
  func.func @rescale_dyn(%arg0: tensor<1x?x?x32xi32>) {
    %0 = tosa.rescale %arg0 {double_round = true, input_zp = 0 : i32, multiplier = array<i32: 1376784203>, output_zp = 0 : i32, per_channel = false, scale32 = true, shift = array<i8: 38>} : (tensor<1x?x?x32xi32>) -> tensor<1x?x?x32xi8>
    return
  }
}