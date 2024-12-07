module {
  func.func @masked_reduce_or_i8(%arg0: vector<32xi8>, %arg1: vector<32xi1>) -> i8 {
    %0 = vector.mask %arg1 { vector.reduction <or>, %arg0 : vector<32xi8> into i8 } : vector<32xi1> -> i8
    return %0 : i8
  }
}