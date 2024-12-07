module {
  func.func @mulsi_extended_scalar(%arg0: i32, %arg1: i32) -> (i32, i32) {
    %low, %high = arith.mulsi_extended %arg0, %arg1 : i32
    return %low, %high : i32, i32
  }
  func.func @mulsi_extended_vector1d(%arg0: vector<3xi64>, %arg1: vector<3xi64>) -> (vector<3xi64>, vector<3xi64>) {
    %low, %high = arith.mulsi_extended %arg0, %arg1 : vector<3xi64>
    return %low, %high : vector<3xi64>, vector<3xi64>
  }
}