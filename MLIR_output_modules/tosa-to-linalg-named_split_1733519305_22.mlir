module {
  func.func @conv2d_quant(%arg0: tensor<1x12x12x1xi8>, %arg1: tensor<1024x3x3x1xi8>, %arg2: tensor<1024xi32>) {
    %0 = tosa.conv2d %arg0, %arg1, %arg2 {dilation = array<i64: 1, 1>, pad = array<i64: 1, 1, 1, 1>, quantization_info = #tosa.conv_quant<input_zp = -22, weight_zp = 42>, stride = array<i64: 1, 1>} : (tensor<1x12x12x1xi8>, tensor<1024x3x3x1xi8>, tensor<1024xi32>) -> tensor<1x12x12x1024xi32>
    return
  }
}