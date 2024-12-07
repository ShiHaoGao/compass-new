module {
  func.func @memref_copy_noncontiguous(%arg0: memref<16x2xi32>, %arg1: index) {
    %alloc = memref.alloc() : memref<2x1xi32>
    %subview = memref.subview %arg0[%arg1, 0] [2, 1] [1, 1] : memref<16x2xi32> to memref<2x1xi32, strided<[2, 1], offset: ?>>
    memref.copy %subview, %alloc : memref<2x1xi32, strided<[2, 1], offset: ?>> to memref<2x1xi32>
    return
  }
}