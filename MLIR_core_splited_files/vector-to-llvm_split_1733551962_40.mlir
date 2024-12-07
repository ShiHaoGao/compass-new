module {
  func.func @extractelement_from_vec_1d_f32_idx_as_i32(%arg0: vector<16xf32>) -> f32 {
    %c15_i32 = arith.constant 15 : i32
    %0 = vector.extractelement %arg0[%c15_i32 : i32] : vector<16xf32>
    return %0 : f32
  }
  func.func @extractelement_from_vec_1d_f32_idx_as_i32_scalable(%arg0: vector<[16]xf32>) -> f32 {
    %c15_i32 = arith.constant 15 : i32
    %0 = vector.extractelement %arg0[%c15_i32 : i32] : vector<[16]xf32>
    return %0 : f32
  }
}