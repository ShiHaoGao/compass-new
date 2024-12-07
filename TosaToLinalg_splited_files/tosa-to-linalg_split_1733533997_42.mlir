module {
  func.func @tile_dyn_input(%arg0: tensor<?x3xi8>) {
    %0 = tosa.tile %arg0 {multiples = array<i64: 2, 1>} : (tensor<?x3xi8>) -> tensor<?x3xi8>
    return
  }
}