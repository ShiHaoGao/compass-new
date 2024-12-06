module {
  func.func @masked_load_op_index(%arg0: memref<?xindex>, %arg1: vector<16xi1>, %arg2: vector<16xindex>) -> vector<16xindex> {
    %c0 = arith.constant 0 : index
    %0 = vector.maskedload %arg0[%c0], %arg1, %arg2 : memref<?xindex>, vector<16xi1>, vector<16xindex> into vector<16xindex>
    return %0 : vector<16xindex>
  }
}