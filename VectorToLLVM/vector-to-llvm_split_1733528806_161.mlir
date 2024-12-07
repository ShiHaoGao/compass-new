module {
  func.func @splat(%arg0: vector<4xf32>, %arg1: f32) -> vector<4xf32> {
    %0 = vector.splat %arg1 : vector<4xf32>
    %1 = arith.mulf %arg0, %0 : vector<4xf32>
    return %1 : vector<4xf32>
  }
}