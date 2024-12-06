module {
  func.func @matrix_ops_index(%arg0: vector<64xindex>, %arg1: vector<48xindex>) -> vector<12xindex> {
    %0 = vector.matrix_multiply %arg0, %arg1 {lhs_columns = 16 : i32, lhs_rows = 4 : i32, rhs_columns = 3 : i32} : (vector<64xindex>, vector<48xindex>) -> vector<12xindex>
    return %0 : vector<12xindex>
  }
}