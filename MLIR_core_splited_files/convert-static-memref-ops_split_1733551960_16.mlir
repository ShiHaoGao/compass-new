module {
  func.func @memref.reshape.dynamic.dim(%arg0: memref<?x?x?xf32>, %arg1: memref<4xi64>) -> memref<?x?x12x32xf32> {
    %reshape = memref.reshape %arg0(%arg1) : (memref<?x?x?xf32>, memref<4xi64>) -> memref<?x?x12x32xf32>
    return %reshape : memref<?x?x12x32xf32>
  }
}