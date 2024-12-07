module {
  func.func @static_alloca_zero() -> memref<32x0x18xf32> {
    %alloca = memref.alloca() : memref<32x0x18xf32>
    return %alloca : memref<32x0x18xf32>
  }
}