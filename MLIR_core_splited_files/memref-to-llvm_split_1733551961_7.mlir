module {
  func.func @address_space(%arg0: memref<32xf32, 7>) {
    %alloc = memref.alloc() : memref<32xf32, 5>
    %c7 = arith.constant 7 : index
    %0 = memref.load %alloc[%c7] : memref<32xf32, 5>
    return
  }
}