module {
  func.func @vector_load_op(%arg0: memref<200x100xf32>, %arg1: index, %arg2: index) -> vector<8xf32> {
    %0 = vector.load %arg0[%arg1, %arg2] : memref<200x100xf32>, vector<8xf32>
    return %0 : vector<8xf32>
  }
}