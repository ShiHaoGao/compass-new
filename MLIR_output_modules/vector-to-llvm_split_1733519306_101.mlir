module {
  func.func @reduce_minui_acc_i32(%arg0: vector<16xi32>, %arg1: i32) -> i32 {
    %0 = vector.reduction <minui>, %arg0, %arg1 : vector<16xi32> into i32
    return %0 : i32
  }
  func.func @reduce_minui_acc_i32_scalable(%arg0: vector<[16]xi32>, %arg1: i32) -> i32 {
    %0 = vector.reduction <minui>, %arg0, %arg1 : vector<[16]xi32> into i32
    return %0 : i32
  }
}