module {
  func.func @memref_copy_0d_offset(%arg0: memref<2xi32>) {
    %alloc = memref.alloc() : memref<i32>
    %subview = memref.subview %arg0[1] [1] [1] : memref<2xi32> to memref<1xi32, strided<[1], offset: 1>>
    %collapse_shape = memref.collapse_shape %subview [] : memref<1xi32, strided<[1], offset: 1>> into memref<i32, strided<[], offset: 1>>
    memref.copy %collapse_shape, %alloc : memref<i32, strided<[], offset: 1>> to memref<i32>
    return
  }
}