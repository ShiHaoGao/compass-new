module {
  func.func @ops(%arg0: f32, %arg1: f32, %arg2: i32, %arg3: i32, %arg4: f64) {
    %0 = math.exp %arg0 : f32
    %1 = math.exp2 %arg0 : f32
    %2 = math.sqrt %arg0 : f32
    %3 = math.sqrt %arg4 : f64
    return
  }
}