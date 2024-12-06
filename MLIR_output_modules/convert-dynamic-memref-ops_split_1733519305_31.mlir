module {
  func.func @ranked_unranked() {
    %alloc = memref.alloc() : memref<1xmemref<*xf32>>
    %cast = memref.cast %alloc : memref<1xmemref<*xf32>> to memref<*xmemref<*xf32>>
    return
  }
}