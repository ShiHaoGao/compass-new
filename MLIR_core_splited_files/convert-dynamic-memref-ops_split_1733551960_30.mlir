module {
  func.func @memref_of_memref_of_memref() {
    %alloc = memref.alloc() : memref<1xmemref<2xmemref<3xf32>>>
    return
  }
}