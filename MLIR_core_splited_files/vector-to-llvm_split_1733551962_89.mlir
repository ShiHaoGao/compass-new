module {
  func.func @reduce_f32(%arg0: vector<16xf32>) -> f32 {
    %0 = vector.reduction <add>, %arg0 : vector<16xf32> into f32
    return %0 : f32
  }
  func.func @reduce_f32_scalable(%arg0: vector<[16]xf32>) -> f32 {
    %0 = vector.reduction <add>, %arg0 : vector<[16]xf32> into f32
    return %0 : f32
  }
}