module {
  func.func @conversion_with_invalid_layout_map(%arg0: memref<?xf32, strided<[10], offset: ?>>) -> memref<?xf32, strided<[10], offset: ?>> {
    %0 = bufferization.clone %arg0 : memref<?xf32, strided<[10], offset: ?>> to memref<?xf32, strided<[10], offset: ?>>
    memref.dealloc %arg0 : memref<?xf32, strided<[10], offset: ?>>
    return %0 : memref<?xf32, strided<[10], offset: ?>>
  }
}