module {
  func.func @vector_type_cast_non_zero_addrspace(%arg0: memref<8x8x8xf32, 3>) -> memref<vector<8x8x8xf32>, 3> {
    %0 = vector.type_cast %arg0 : memref<8x8x8xf32, 3> to memref<vector<8x8x8xf32>, 3>
    return %0 : memref<vector<8x8x8xf32>, 3>
  }
}