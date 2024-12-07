module {
  func.func @collapse_shape_dynamic(%arg0: memref<1x2x?xf32>) -> memref<1x?xf32> {
    %collapse_shape = memref.collapse_shape %arg0 [[0], [1, 2]] : memref<1x2x?xf32> into memref<1x?xf32>
    return %collapse_shape : memref<1x?xf32>
  }
}