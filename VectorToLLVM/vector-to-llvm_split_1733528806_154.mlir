module {
  func.func @scatter_op_index(%arg0: memref<?xindex>, %arg1: vector<3xindex>, %arg2: vector<3xi1>, %arg3: vector<3xindex>) {
    %c0 = arith.constant 0 : index
    vector.scatter %arg0[%c0] [%arg1], %arg2, %arg3 : memref<?xindex>, vector<3xindex>, vector<3xi1>, vector<3xindex>
    return
  }
}