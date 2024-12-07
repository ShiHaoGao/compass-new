module {
  func.func @memref_dim_with_dyn_index(%arg0: memref<3x?xf32>, %arg1: index) -> index {
    %dim = memref.dim %arg0, %arg1 : memref<3x?xf32>
    return %dim : index
  }
}