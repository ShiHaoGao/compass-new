module {
  func.func @expand_shape_dynamic_with_non_identity_layout(%arg0: memref<1x?xf32, strided<[?, ?], offset: ?>>, %arg1: index) -> memref<1x2x?xf32, strided<[?, ?, ?], offset: ?>> {
    %expand_shape = memref.expand_shape %arg0 [[0], [1, 2]] output_shape [1, 2, %arg1] : memref<1x?xf32, strided<[?, ?], offset: ?>> into memref<1x2x?xf32, strided<[?, ?, ?], offset: ?>>
    return %expand_shape : memref<1x2x?xf32, strided<[?, ?, ?], offset: ?>>
  }
}