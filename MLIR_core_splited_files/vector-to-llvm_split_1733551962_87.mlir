module {
  func.func @reduce_0d_f32(%arg0: vector<f32>) -> f32 {
    %0 = vector.reduction <add>, %arg0 : vector<f32> into f32
    return %0 : f32
  }
}