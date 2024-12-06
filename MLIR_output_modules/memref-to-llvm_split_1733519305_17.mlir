module {
  func.func @memref_copy_ranked() {
    %alloc = memref.alloc() : memref<2xf32>
    %cast = memref.cast %alloc : memref<2xf32> to memref<?xf32>
    %alloc_0 = memref.alloc() : memref<2xf32>
    %cast_1 = memref.cast %alloc_0 : memref<2xf32> to memref<?xf32>
    memref.copy %cast, %cast_1 : memref<?xf32> to memref<?xf32>
    return
  }
}