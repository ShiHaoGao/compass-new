module {
  tosa.variable @var_x = dense<7.000000e+00> : tensor<1xf32>
  func.func @test_stateful_ops(%arg0: tensor<1xf32>) -> tensor<1xf32> {
    tosa.variable.write @var_x, %arg0 : tensor<1xf32>
    %0 = tosa.variable.read @var_x : tensor<1xf32>
    return %0 : tensor<1xf32>
  }
}