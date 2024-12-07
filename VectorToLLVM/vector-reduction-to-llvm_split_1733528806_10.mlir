module {
  func.func @masked_reduce_maximumf_f32(%arg0: vector<16xf32>, %arg1: vector<16xi1>) -> f32 {
    %0 = vector.mask %arg1 { vector.reduction <maximumf>, %arg0 : vector<16xf32> into f32 } : vector<16xi1> -> f32
    return %0 : f32
  }
}