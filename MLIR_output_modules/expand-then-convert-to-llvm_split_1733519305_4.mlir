module {
  func.func @subview_const_size(%arg0: memref<64x4xf32, strided<[4, 1]>>, %arg1: index, %arg2: index, %arg3: index) -> memref<4x2xf32, strided<[?, ?], offset: ?>> {
    %subview = memref.subview %arg0[%arg1, %arg2] [4, 2] [%arg1, %arg2] : memref<64x4xf32, strided<[4, 1]>> to memref<4x2xf32, strided<[?, ?], offset: ?>>
    return %subview : memref<4x2xf32, strided<[?, ?], offset: ?>>
  }
}