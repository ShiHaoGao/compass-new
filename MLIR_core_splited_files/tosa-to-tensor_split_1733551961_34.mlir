module {
  func.func @slice(%arg0: tensor<6xf32>) {
    %0 = tosa.slice %arg0 {size = array<i64: 1>, start = array<i64: 2>} : (tensor<6xf32>) -> tensor<1xf32>
    return
  }
}