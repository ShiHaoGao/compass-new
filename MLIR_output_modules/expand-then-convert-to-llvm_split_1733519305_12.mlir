module {
  func.func @collapse_shape_static(%arg0: memref<1x3x4x1x5xf32>) -> memref<3x4x5xf32> {
    %collapse_shape = memref.collapse_shape %arg0 [[0, 1], [2], [3, 4]] : memref<1x3x4x1x5xf32> into memref<3x4x5xf32>
    return %collapse_shape : memref<3x4x5xf32>
  }
}