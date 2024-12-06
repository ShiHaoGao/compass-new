module {
  func.func @reduce_maxsi_i32(%arg0: vector<16xi32>) -> i32 {
    %0 = vector.reduction <maxsi>, %arg0 : vector<16xi32> into i32
    return %0 : i32
  }
  func.func @reduce_maxsi_i32_scalable(%arg0: vector<[16]xi32>) -> i32 {
    %0 = vector.reduction <maxsi>, %arg0 : vector<[16]xi32> into i32
    return %0 : i32
  }
}