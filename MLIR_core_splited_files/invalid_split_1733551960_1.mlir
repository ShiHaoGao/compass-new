module {
  func.func @bad_address_space(%arg0: memref<2xindex, "foo">) {
    %c0 = arith.constant 0 : index
    memref.store %c0, %arg0[%c0] : memref<2xindex, "foo">
    return
  }
}