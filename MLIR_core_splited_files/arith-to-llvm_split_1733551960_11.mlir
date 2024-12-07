module {
  func.func @minmaxi(%arg0: i32, %arg1: i32) -> i32 {
    %0 = arith.minsi %arg0, %arg1 : i32
    %1 = arith.maxsi %arg0, %arg1 : i32
    %2 = arith.minui %arg0, %arg1 : i32
    %3 = arith.maxui %arg0, %arg1 : i32
    return %0 : i32
  }
  func.func @minmaxf(%arg0: f32, %arg1: f32) -> f32 {
    %0 = arith.minimumf %arg0, %arg1 : f32
    %1 = arith.maximumf %arg0, %arg1 : f32
    %2 = arith.minnumf %arg0, %arg1 : f32
    %3 = arith.maxnumf %arg0, %arg1 : f32
    return %0 : f32
  }
}