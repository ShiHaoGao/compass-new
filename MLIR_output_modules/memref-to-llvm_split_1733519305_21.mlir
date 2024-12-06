module {
  func.func @memref_copy_unranked() {
    %alloc = memref.alloc() : memref<2xi1>
    %cast = memref.cast %alloc : memref<2xi1> to memref<*xi1>
    %alloc_0 = memref.alloc() : memref<2xi1>
    %cast_1 = memref.cast %alloc_0 : memref<2xi1> to memref<*xi1>
    memref.copy %cast, %cast_1 : memref<*xi1> to memref<*xi1>
    return
  }
}