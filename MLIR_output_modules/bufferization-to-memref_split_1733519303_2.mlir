module {
  func.func @conversion_dynamic(%arg0: memref<?xf32>) -> memref<?xf32> {
    %0 = bufferization.clone %arg0 : memref<?xf32> to memref<?xf32>
    memref.dealloc %arg0 : memref<?xf32>
    return %0 : memref<?xf32>
  }
}