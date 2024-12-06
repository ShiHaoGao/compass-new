module {
  func.func @depthwise_conv_quant(%arg0: tensor<1x12x12x4xi8>, %arg1: tensor<3x3x4x128xi8>, %arg2: tensor<512xi32>) {
    %0 = tosa.depthwise_conv2d %arg0, %arg1, %arg2 {dilation = array<i64: 1, 1>, pad = array<i64: 1, 1, 1, 1>, quantization_info = #tosa.conv_quant<input_zp = -128, weight_zp = 42>, stride = array<i64: 1, 1>} : (tensor<1x12x12x4xi8>, tensor<3x3x4x128xi8>, tensor<512xi32>) -> tensor<1x12x12x512xi32>
    return
  }
}