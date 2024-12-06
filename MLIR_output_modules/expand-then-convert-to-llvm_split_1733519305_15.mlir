module {
  func.func @collapse_shape_fold_zero_dim(%arg0: memref<1x1xf32>) -> memref<f32> {
    %collapse_shape = memref.collapse_shape %arg0 [] : memref<1x1xf32> into memref<f32>
    return %collapse_shape : memref<f32>
  }
}