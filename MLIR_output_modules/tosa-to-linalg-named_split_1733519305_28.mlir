module {
  func.func @depthwise_conv_quant_dilations(%arg0: tensor<1x14x14x4xi8>, %arg1: tensor<3x3x4x128xi8>, %arg2: tensor<512xi32>) {
    %0 = tosa.depthwise_conv2d %arg0, %arg1, %arg2 {dilation = array<i64: 2, 2>, pad = array<i64: 0, 0, 0, 0>, quantization_info = #tosa.conv_quant<input_zp = -128, weight_zp = 42>, stride = array<i64: 1, 1>} : (tensor<1x14x14x4xi8>, tensor<3x3x4x128xi8>, tensor<512xi32>) -> tensor<1x10x10x512xi32>
    return
  }
  func.func @depthwise_conv2d_dyn_w_h(%arg0: tensor<2x?x?x3xf32>, %arg1: tensor<3x6x3x5xf32>, %arg2: tensor<15xf32>) {
    %0 = tosa.depthwise_conv2d %arg0, %arg1, %arg2 {dilation = array<i64: 2, 1>, pad = array<i64: 1, 2, 3, 4>, stride = array<i64: 1, 2>} : (tensor<2x?x?x3xf32>, tensor<3x6x3x5xf32>, tensor<15xf32>) -> tensor<2x?x?x15xf32>
    return
  }
}