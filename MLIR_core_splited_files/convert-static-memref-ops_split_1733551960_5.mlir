module {
  func.func @static_alloca() -> memref<32x18xf32> {
    %alloca = memref.alloca() : memref<32x18xf32>
    %alloca_0 = memref.alloca() {alignment = 32 : i64} : memref<32x18xf32>
    return %alloca : memref<32x18xf32>
  }
}