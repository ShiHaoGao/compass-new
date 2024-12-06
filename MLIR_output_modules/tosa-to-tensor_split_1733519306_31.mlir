module {
  func.func @reshape_bug_fix(%arg0: tensor<?xf32>) -> tensor<1x1x1x?xf32> {
    %0 = tosa.reshape %arg0 {new_shape = array<i64: 1, 1, 1, -1>} : (tensor<?xf32>) -> tensor<1x1x1x?xf32>
    return %0 : tensor<1x1x1x?xf32>
  }
}