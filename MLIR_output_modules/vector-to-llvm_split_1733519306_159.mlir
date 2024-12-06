module {
  func.func @compress_store_op_index(%arg0: memref<?xindex>, %arg1: vector<11xi1>, %arg2: vector<11xindex>) {
    %c0 = arith.constant 0 : index
    vector.compressstore %arg0[%c0], %arg1, %arg2 : memref<?xindex>, vector<11xi1>, vector<11xindex>
    return
  }
}