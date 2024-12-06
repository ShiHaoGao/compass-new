module {
  func.func @memref_index(%arg0: memref<32xindex>) -> memref<32xindex> {
    return %arg0 : memref<32xindex>
  }
}