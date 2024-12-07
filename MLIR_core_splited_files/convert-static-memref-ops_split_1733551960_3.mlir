module {
  func.func @aligned_1d_alloc() -> memref<42xf32> {
    %alloc = memref.alloc() {alignment = 8 : i64} : memref<42xf32>
    return %alloc : memref<42xf32>
  }
}