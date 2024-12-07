module {
  func.func @type_cast_f32(%arg0: memref<8x8x8xf32>) -> memref<vector<8x8x8xf32>> {
    %0 = vector.type_cast %arg0 : memref<8x8x8xf32> to memref<vector<8x8x8xf32>>
    return %0 : memref<vector<8x8x8xf32>>
  }
}