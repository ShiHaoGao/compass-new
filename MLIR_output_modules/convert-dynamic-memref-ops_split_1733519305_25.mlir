module {
  func.func @memref_reinterpret_cast_ranked_to_static_shape(%arg0: memref<2x3xf32>) {
    %reinterpret_cast = memref.reinterpret_cast %arg0 to offset: [0], sizes: [6, 1], strides: [1, 1] : memref<2x3xf32> to memref<6x1xf32>
    return
  }
}