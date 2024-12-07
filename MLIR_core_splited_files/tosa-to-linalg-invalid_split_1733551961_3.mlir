module {
  func.func @unranked_add(%arg0: tensor<10x10xf32>, %arg1: tensor<10x10xf32>, %arg2: tensor<*xf32>) -> tensor<10x10xf32> {
    %0 = tosa.reduce_max %arg0 {axis = 1 : i32} : (tensor<10x10xf32>) -> tensor<10x1xf32>
    %1 = tosa.add %0, %arg1 : (tensor<10x1xf32>, tensor<10x10xf32>) -> tensor<10x10xf32>
    %2 = tosa.add %1, %arg2 : (tensor<10x10xf32>, tensor<*xf32>) -> tensor<*xf32>
    %3 = tosa.reshape %2 {new_shape = array<i64: 10, 10>} : (tensor<*xf32>) -> tensor<10x10xf32>
    return %3 : tensor<10x10xf32>
  }
}