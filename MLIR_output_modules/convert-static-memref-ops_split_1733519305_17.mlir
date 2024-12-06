module {
  func.func @memref.reshape_index(%arg0: memref<?x?xi32>, %arg1: memref<1xindex>) -> memref<?xi32> {
    %reshape = memref.reshape %arg0(%arg1) : (memref<?x?xi32>, memref<1xindex>) -> memref<?xi32>
    return %reshape : memref<?xi32>
  }
  func.func @memref_memory_space_cast(%arg0: memref<?xf32>) -> memref<?xf32, 1> {
    %memspacecast = memref.memory_space_cast %arg0 : memref<?xf32> to memref<?xf32, 1>
    return %memspacecast : memref<?xf32, 1>
  }
}