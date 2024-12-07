module {
  func.func @pad_float(%arg0: tensor<1x2xf32>) -> tensor<4x9xf32> {
    %cst = arith.constant dense<[[1, 2], [3, 4]]> : tensor<2x2xi32>
    %0 = tosa.pad %arg0, %cst : (tensor<1x2xf32>, tensor<2x2xi32>) -> tensor<4x9xf32>
    return %0 : tensor<4x9xf32>
  }
  func.func @pad_int(%arg0: tensor<1x2xi32>) -> tensor<4x9xi32> {
    %cst = arith.constant dense<[[1, 2], [3, 4]]> : tensor<2x2xi32>
    %0 = tosa.pad %arg0, %cst : (tensor<1x2xi32>, tensor<2x2xi32>) -> tensor<4x9xi32>
    return %0 : tensor<4x9xi32>
  }
  func.func @pad_quant(%arg0: tensor<1x2xi32>) -> tensor<4x9xi32> {
    %cst = arith.constant dense<[[1, 2], [3, 4]]> : tensor<2x2xi32>
    %0 = tosa.pad %arg0, %cst {quantization_info = #tosa.pad_quant<input_zp = 42>} : (tensor<1x2xi32>, tensor<2x2xi32>) -> tensor<4x9xi32>
    return %0 : tensor<4x9xi32>
  }
}