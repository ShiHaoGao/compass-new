module {
  func.func @load_non_temporal(%arg0: memref<32xf32>) {
    %c7 = arith.constant 7 : index
    %0 = memref.load %arg0[%c7] {nontemporal = true} : memref<32xf32>
    return
  }
}