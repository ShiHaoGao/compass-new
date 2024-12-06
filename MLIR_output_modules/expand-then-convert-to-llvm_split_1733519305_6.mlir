module {
  func.func @subview_const_stride_and_offset(%arg0: memref<64x4xf32, strided<[4, 1]>>) -> memref<62x3xf32, strided<[4, 1], offset: 8>> {
    %subview = memref.subview %arg0[0, 8] [62, 3] [1, 1] : memref<64x4xf32, strided<[4, 1]>> to memref<62x3xf32, strided<[4, 1], offset: 8>>
    return %subview : memref<62x3xf32, strided<[4, 1], offset: 8>>
  }
}