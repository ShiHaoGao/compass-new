module {
  func.func @conversion_with_layout_map(%arg0: memref<?xf32, strided<[?], offset: ?>>) -> memref<?xf32, strided<[?], offset: ?>> {
    %0 = bufferization.clone %arg0 : memref<?xf32, strided<[?], offset: ?>> to memref<?xf32, strided<[?], offset: ?>>
    memref.dealloc %arg0 : memref<?xf32, strided<[?], offset: ?>>
    return %0 : memref<?xf32, strided<[?], offset: ?>>
  }
}