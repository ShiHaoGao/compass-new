module {
  func.func @expand_shape_zero_dim(%arg0: memref<f32>) -> memref<1x1xf32> {
    %expand_shape = memref.expand_shape %arg0 [] output_shape [1, 1] : memref<f32> into memref<1x1xf32>
    return %expand_shape : memref<1x1xf32>
  }
}