module {
  func.func @reduce_add_f32_always_reassoc(%arg0: vector<16xf32>) -> f32 {
    %0 = vector.reduction <add>, %arg0 fastmath<reassoc> : vector<16xf32> into f32
    return %0 : f32
  }
}