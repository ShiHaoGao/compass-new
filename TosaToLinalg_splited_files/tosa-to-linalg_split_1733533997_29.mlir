module {
  func.func @reduce_float_dyn_nonzero_batch(%arg0: tensor<5x?x4xf32>) {
    %0 = tosa.reduce_prod %arg0 {axis = 2 : i32} : (tensor<5x?x4xf32>) -> tensor<5x?x1xf32>
    return
  }
}