module {
  func.func @subview_mixed_static_dynamic(%arg0: memref<64x4xf32, strided<[4, 1]>>, %arg1: index, %arg2: index, %arg3: index) -> memref<62x?xf32, strided<[?, 1], offset: ?>> {
    %subview = memref.subview %arg0[%arg2, 8] [62, %arg3] [%arg1, 1] : memref<64x4xf32, strided<[4, 1]>> to memref<62x?xf32, strided<[?, 1], offset: ?>>
    return %subview : memref<62x?xf32, strided<[?, 1], offset: ?>>
  }
}