module {
  func.func @conv2d_i8(%arg0: tensor<1x49x42x27xi8>, %arg1: tensor<28x1x1x27xi8>, %arg2: tensor<28xi8>) {
    %0 = tosa.conv2d %arg0, %arg1, %arg2 {dilation = array<i64: 2, 1>, pad = array<i64: 0, 0, 0, 0>, quantization_info = #tosa.conv_quant<input_zp = 0, weight_zp = 0>, stride = array<i64: 1, 1>} : (tensor<1x49x42x27xi8>, tensor<28x1x1x27xi8>, tensor<28xi8>) -> tensor<1x45x40x28xi32>
    return
  }
}