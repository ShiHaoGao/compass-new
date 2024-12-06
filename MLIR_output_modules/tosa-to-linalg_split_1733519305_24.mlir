module {
  func.func @test_negate_quantized(%arg0: tensor<1xi8>) {
    %0 = tosa.negate %arg0 {quantization_info = #tosa.unary_quant<input_zp = 0, output_zp = 7>} : (tensor<1xi8>) -> tensor<1xi8>
    %1 = tosa.negate %arg0 {quantization_info = #tosa.unary_quant<input_zp = 32639, output_zp = 0>} : (tensor<1xi8>) -> tensor<1xi8>
    %2 = tosa.negate %arg0 {quantization_info = #tosa.unary_quant<input_zp = 32640, output_zp = 0>} : (tensor<1xi8>) -> tensor<1xi8>
    %3 = tosa.negate %arg0 {quantization_info = #tosa.unary_quant<input_zp = 0, output_zp = 0>} : (tensor<1xi8>) -> tensor<1xi8>
    return
  }
}