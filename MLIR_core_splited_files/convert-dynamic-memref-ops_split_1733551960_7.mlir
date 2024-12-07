module {
  func.func @stdlib_aligned_alloc(%arg0: index) -> memref<32x18xf32> {
    %alloc = memref.alloc() {alignment = 32 : i64} : memref<32x18xf32>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<4096xf32>
    %alloc_1 = memref.alloc() : memref<4096xvector<8xf32>>
    %alloc_2 = memref.alloc() : memref<4096xvector<2xf32>>
    %alloc_3 = memref.alloc() {alignment = 8 : i64} : memref<1024xvector<4xf32>>
    %alloc_4 = memref.alloc() {alignment = 32 : i64} : memref<100xf32>
    %alloc_5 = memref.alloc(%arg0) : memref<?xvector<18xf32>>
    return %alloc : memref<32x18xf32>
  }
}