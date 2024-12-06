module {
  func.func @collapse_shape_dynamic_with_non_identity_layout(%arg0: memref<4x?x?xf32, strided<[?, 4, 1], offset: ?>>) -> memref<4x?xf32, strided<[?, ?], offset: ?>> {
    %collapse_shape = memref.collapse_shape %arg0 [[0], [1, 2]] : memref<4x?x?xf32, strided<[?, 4, 1], offset: ?>> into memref<4x?xf32, strided<[?, ?], offset: ?>>
    return %collapse_shape : memref<4x?xf32, strided<[?, ?], offset: ?>>
  }
}