module {
  func.func private @printMemrefF32(tensor<*xf32>)
  func.func @main() {
    %cst = arith.constant dense<[[8.000000e+00, 1.000000e+00, 6.000000e+00], [3.000000e+00, 5.000000e+00, 7.000000e+00], [4.000000e+00, 9.000000e+00, 2.000000e+00]]> : tensor<3x3xf32>
    %cst_0 = arith.constant dense<1.000000e+00> : tensor<3x3xf32>
    %cst_1 = arith.constant dense<[0.000000e+00, 1.000000e+00, 2.000000e+00]> : tensor<3xf32>
    %0 = tosa.fully_connected %cst, %cst_0, %cst_1 : (tensor<3x3xf32>, tensor<3x3xf32>, tensor<3xf32>) -> tensor<3x3xf32>
    %cast = tensor.cast %0 : tensor<3x3xf32> to tensor<*xf32>
    call @printMemrefF32(%cast) : (tensor<*xf32>) -> ()
    return
  }
}