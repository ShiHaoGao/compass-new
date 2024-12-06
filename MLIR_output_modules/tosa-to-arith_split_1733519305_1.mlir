module {
  func.func @const_test() -> tensor<i32> {
    %0 = "tosa.const"() <{value = dense<3> : tensor<i32>}> : () -> tensor<i32>
    return %0 : tensor<i32>
  }
}