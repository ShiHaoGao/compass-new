module {
  func.func @while_test(%arg0: tensor<i32>) -> tensor<i32> {
    %0 = tosa.while_loop (%arg1 = %arg0) : (tensor<i32>) -> tensor<i32> {
      %1 = "tosa.const"() <{value = dense<3> : tensor<i32>}> : () -> tensor<i32>
      %2 = tosa.greater_equal %1, %arg1 : (tensor<i32>, tensor<i32>) -> tensor<i1>
      tosa.yield %2 : tensor<i1>
    } do {
    ^bb0(%arg1: tensor<i32>):
      %1 = "tosa.const"() <{value = dense<1> : tensor<i32>}> : () -> tensor<i32>
      %2 = tosa.add %arg1, %1 : (tensor<i32>, tensor<i32>) -> tensor<i32>
      tosa.yield %2 : tensor<i32>
    }
    return %0 : tensor<i32>
  }
}