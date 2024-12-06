module attributes {dlti.dl_spec = #dlti.dl_spec<index = 32 : i64>} {
  func.func @memref_of_memref_32() {
    %alloc = memref.alloc() : memref<1xmemref<1xf32>>
    return
  }
}