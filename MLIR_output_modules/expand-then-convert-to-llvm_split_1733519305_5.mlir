module {
  func.func @subview_const_stride(%arg0: memref<64x4xf32, strided<[4, 1]>>, %arg1: index, %arg2: index, %arg3: index) -> memref<?x?xf32, strided<[4, 2], offset: ?>> {
    %subview = memref.subview %arg0[%arg1, %arg2] [%arg1, %arg2] [1, 2] : memref<64x4xf32, strided<[4, 1]>> to memref<?x?xf32, strided<[4, 2], offset: ?>>
    return %subview : memref<?x?xf32, strided<[4, 2], offset: ?>>
  }
}