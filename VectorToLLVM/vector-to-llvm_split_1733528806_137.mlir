module {
  func.func @vector_store_op_index(%arg0: memref<200x100xindex>, %arg1: index, %arg2: index) {
    %cst = arith.constant dense<11> : vector<4xindex>
    vector.store %cst, %arg0[%arg1, %arg2] : memref<200x100xindex>, vector<4xindex>
    return
  }
}