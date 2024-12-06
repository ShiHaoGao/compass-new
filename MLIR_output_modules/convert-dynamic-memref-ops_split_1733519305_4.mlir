module {
  func.func @dynamic_alloc(%arg0: index, %arg1: index) -> memref<?x?xf32> {
    %alloc = memref.alloc(%arg0, %arg1) : memref<?x?xf32>
    return %alloc : memref<?x?xf32>
  }
}