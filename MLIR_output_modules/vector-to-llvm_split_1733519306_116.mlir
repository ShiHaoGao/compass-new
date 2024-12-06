module {
  func.func @matrix_ops(%arg0: vector<64xf64>, %arg1: vector<48xf64>) -> vector<12xf64> {
    %0 = vector.matrix_multiply %arg0, %arg1 {lhs_columns = 16 : i32, lhs_rows = 4 : i32, rhs_columns = 3 : i32} : (vector<64xf64>, vector<48xf64>) -> vector<12xf64>
    return %0 : vector<12xf64>
  }
}