module {
  func.func @slice_resultType_unranked(%arg0: tensor<?xf32>) -> tensor<*xf32> {
    %0 = tosa.slice %arg0 {size = array<i64: 0>, start = array<i64: 2>} : (tensor<?xf32>) -> tensor<*xf32>
    return %0 : tensor<*xf32>
  }
}