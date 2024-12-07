module {
  func.func @expand_shape_dynamic(%arg0: memref<1x?xf32>, %arg1: index) -> memref<1x2x?xf32> {
    %expand_shape = memref.expand_shape %arg0 [[0], [1, 2]] output_shape [1, 2, %arg1] : memref<1x?xf32> into memref<1x2x?xf32>
    return %expand_shape : memref<1x2x?xf32>
  }
}