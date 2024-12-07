module {
  func.func @masked_reduce_minf_f32_scalable(%arg0: vector<[16]xf32>, %arg1: vector<[16]xi1>) -> f32 {
    %0 = vector.mask %arg1 { vector.reduction <minnumf>, %arg0 : vector<[16]xf32> into f32 } : vector<[16]xi1> -> f32
    return %0 : f32
  }
}