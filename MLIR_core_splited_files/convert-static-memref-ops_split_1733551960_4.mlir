module {
  func.func @static_alloc() -> memref<32x18xf32> {
    %alloc = memref.alloc() : memref<32x18xf32>
    return %alloc : memref<32x18xf32>
  }
}