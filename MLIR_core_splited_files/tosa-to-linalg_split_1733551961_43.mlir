module {
  func.func @tile_dyn_multiples(%arg0: tensor<2x3xi8>) {
    %0 = tosa.tile %arg0 {multiples = array<i64: 2, -1>} : (tensor<2x3xi8>) -> tensor<2x?xi8>
    return
  }
}