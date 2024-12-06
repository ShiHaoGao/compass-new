module {
  func.func @memref_reshape(%arg0: memref<2x3xf32>, %arg1: memref<?xindex>) {
    %reshape = memref.reshape %arg0(%arg1) : (memref<2x3xf32>, memref<?xindex>) -> memref<*xf32>
    return
  }
}