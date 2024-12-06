module {
  func.func @fastmath(%arg0: f32, %arg1: vector<4xf32>) {
    %0 = math.trunc %arg0 fastmath<fast> : f32
    %1 = math.powf %arg0, %arg0 fastmath<afn> : f32
    %2 = math.sqrt %arg0 : f32
    %3 = math.fma %arg0, %arg0, %arg0 fastmath<fast> : f32
    return
  }
}