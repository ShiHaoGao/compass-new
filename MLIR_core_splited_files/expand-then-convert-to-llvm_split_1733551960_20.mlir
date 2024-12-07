module {
  func.func @collapse_static_shape_with_non_identity_layout(%arg0: memref<1x1x8x8xf32, strided<[64, 64, 8, 1], offset: ?>>) -> memref<64xf32, strided<[1], offset: ?>> {
    %collapse_shape = memref.collapse_shape %arg0 [[0, 1, 2, 3]] : memref<1x1x8x8xf32, strided<[64, 64, 8, 1], offset: ?>> into memref<64xf32, strided<[1], offset: ?>>
    return %collapse_shape : memref<64xf32, strided<[1], offset: ?>>
  }
}