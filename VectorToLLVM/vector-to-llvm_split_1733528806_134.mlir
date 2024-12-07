module {
  func.func @vector_load_op_index(%arg0: memref<200x100xindex>, %arg1: index, %arg2: index) -> vector<8xindex> {
    %0 = vector.load %arg0[%arg1, %arg2] : memref<200x100xindex>, vector<8xindex>
    return %0 : vector<8xindex>
  }
}