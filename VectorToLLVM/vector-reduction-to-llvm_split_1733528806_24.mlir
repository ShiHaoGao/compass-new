module {
  func.func @masked_reduce_xor_i8_scalable(%arg0: vector<[32]xi8>, %arg1: vector<[32]xi1>) -> i8 {
    %0 = vector.mask %arg1 { vector.reduction <xor>, %arg0 : vector<[32]xi8> into i8 } : vector<[32]xi1> -> i8
    return %0 : i8
  }
}