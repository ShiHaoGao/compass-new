module {
  func.func @index_vector(%arg0: vector<4xindex>) {
    %cst = arith.constant dense<[0, 1, 2, 3]> : vector<4xindex>
    %0 = arith.addi %arg0, %cst : vector<4xindex>
    return
  }
}