module attributes {dlti.dl_spec = #dlti.dl_spec<index = 32 : i64>} {
  func.func @address() {
    %c1 = arith.constant 1 : index
    %alloc = memref.alloc(%c1) : memref<?xvector<2xf32>>
    return
  }
}