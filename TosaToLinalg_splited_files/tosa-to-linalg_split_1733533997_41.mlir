module {
  func.func @tile(%arg0: tensor<2x3xi8>) {
    %0 = tosa.tile %arg0 {multiples = array<i64: 2, 1>} : (tensor<2x3xi8>) -> tensor<4x3xi8>
    %1 = tosa.tile %arg0 {multiples = array<i64: 1, 2>} : (tensor<2x3xi8>) -> tensor<2x6xi8>
    %2 = tosa.tile %arg0 {multiples = array<i64: 5, 7>} : (tensor<2x3xi8>) -> tensor<10x21xi8>
    return
  }
}