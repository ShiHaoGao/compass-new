module {
  func.func @vector_store_op_0d(%arg0: memref<200x100xf32>, %arg1: index, %arg2: index) {
    %cst = arith.constant dense<1.100000e+01> : vector<f32>
    vector.store %cst, %arg0[%arg1, %arg2] : memref<200x100xf32>, vector<f32>
    return
  }
}