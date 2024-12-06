module {
  func.func @reduce_i64(%arg0: vector<16xi64>) -> i64 {
    %0 = vector.reduction <add>, %arg0 : vector<16xi64> into i64
    return %0 : i64
  }
  func.func @reduce_i64_scalable(%arg0: vector<[16]xi64>) -> i64 {
    %0 = vector.reduction <add>, %arg0 : vector<[16]xi64> into i64
    return %0 : i64
  }
}