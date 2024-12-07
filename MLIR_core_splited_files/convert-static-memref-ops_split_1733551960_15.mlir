module {
  memref.global "private" constant @__constant_3xi64 : memref<3xi64> = dense<[2, 6, 20]>
  func.func @memref.reshape(%arg0: memref<4x5x6xf32>) -> memref<2x6x20xf32> {
    %0 = memref.get_global @__constant_3xi64 : memref<3xi64>
    %reshape = memref.reshape %arg0(%0) : (memref<4x5x6xf32>, memref<3xi64>) -> memref<2x6x20xf32>
    return %reshape : memref<2x6x20xf32>
  }
}