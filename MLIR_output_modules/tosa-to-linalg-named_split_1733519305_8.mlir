module {
  func.func @quantized_fully_connected(%arg0: tensor<5x3xi8>, %arg1: tensor<6x3xi8>, %arg2: tensor<6xi32>) -> tensor<5x6xi32> {
    %0 = tosa.fully_connected %arg0, %arg1, %arg2 {quantization_info = #tosa.conv_quant<input_zp = 1, weight_zp = 2>} : (tensor<5x3xi8>, tensor<6x3xi8>, tensor<6xi32>) -> tensor<5x6xi32>
    return %0 : tensor<5x6xi32>
  }
}