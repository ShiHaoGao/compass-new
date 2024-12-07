module {
  func.func @conv3d_i8(%arg0: tensor<1x49x48x47x27xi8>, %arg1: tensor<28x3x4x5x27xi8>, %arg2: tensor<28xi32>) {
    %0 = tosa.conv3d %arg0, %arg1, %arg2 {dilation = array<i64: 1, 1, 1>, pad = array<i64: 0, 0, 0, 0, 0, 0>, quantization_info = #tosa.conv_quant<input_zp = -128, weight_zp = 42>, stride = array<i64: 1, 1, 1>} : (tensor<1x49x48x47x27xi8>, tensor<28x3x4x5x27xi8>, tensor<28xi32>) -> tensor<1x47x45x43x28xi32>
    return
  }
}