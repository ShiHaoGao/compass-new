module {
  func.func @reduce_mul_f32(%arg0: vector<16xf32>) -> f32 {
    %0 = vector.reduction <mul>, %arg0 fastmath<nnan,ninf> : vector<16xf32> into f32
    return %0 : f32
  }
}