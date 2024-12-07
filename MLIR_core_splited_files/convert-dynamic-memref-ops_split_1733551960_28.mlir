module {
  func.func @memref_of_memref() {
    %alloc = memref.alloc() : memref<1xmemref<1xf32>>
    return
  }
}