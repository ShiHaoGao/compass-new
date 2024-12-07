module {
  func.func @memref_copy_contiguous(%arg0: memref<16x4xi32>, %arg1: index) {
    %alloc = memref.alloc() : memref<1x2xi32>
    %subview = memref.subview %arg0[%arg1, 0] [1, 2] [1, 1] : memref<16x4xi32> to memref<1x2xi32, strided<[4, 1], offset: ?>>
    memref.copy %subview, %alloc : memref<1x2xi32, strided<[4, 1], offset: ?>> to memref<1x2xi32>
    return
  }
}