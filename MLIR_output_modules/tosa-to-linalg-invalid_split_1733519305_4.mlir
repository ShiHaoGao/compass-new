module {
  func.func @rfft2d_with_non_float_type(%arg0: tensor<1x1x1xi32>) -> (tensor<1x1x1xi32>, tensor<1x1x1xi32>) {
    %output_real, %output_imag = tosa.rfft2d %arg0 : (tensor<1x1x1xi32>) -> (tensor<1x1x1xi32>, tensor<1x1x1xi32>)
    return %output_real, %output_imag : tensor<1x1x1xi32>, tensor<1x1x1xi32>
  }
}