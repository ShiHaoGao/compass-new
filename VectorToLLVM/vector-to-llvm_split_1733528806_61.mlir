module {
  func.func @type_cast_index(%arg0: memref<8x8x8xindex>) -> memref<vector<8x8x8xindex>> {
    %0 = vector.type_cast %arg0 : memref<8x8x8xindex> to memref<vector<8x8x8xindex>>
    return %0 : memref<vector<8x8x8xindex>>
  }
}