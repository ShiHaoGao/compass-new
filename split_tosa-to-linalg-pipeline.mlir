module {
}

// -----
module {
  func.func @test_variable_write_shape(%arg0: tensor<1x4x8xi32>) {
    tosa.variable @stored_var = dense<-1> : tensor<2x4x8xi32>
    tosa.variable.write @stored_var, %arg0 : tensor<1x4x8xi32>
    return
  }
}

// -----
module {
  func.func @tensor_with_unknown_rank(%arg0: tensor<*xi8>) -> tensor<*xi8> {
    %0 = tosa.abs %arg0 : (tensor<*xi8>) -> tensor<*xi8>
    return %0 : tensor<*xi8>
  }
}

// -----
// -----
module {
  func.func @avg_pool2d_with_unsupported_quant_type(%arg0: tensor<1x7x7x9x!quant.uniform<i8:f32, 1.000000e-02>>) -> tensor<1x7x7x9x!quant.uniform<i8:f32, 1.000000e-02>> {
    %0 = tosa.avg_pool2d %arg0 {acc_type = i32, kernel = array<i64: 2, 2>, pad = array<i64: 0, 1, 0, 1>, stride = array<i64: 1, 1>} : (tensor<1x7x7x9x!quant.uniform<i8:f32, 1.000000e-02>>) -> tensor<1x7x7x9x!quant.uniform<i8:f32, 1.000000e-02>>
    return %0 : tensor<1x7x7x9x!quant.uniform<i8:f32, 1.000000e-02>>
  }
}

