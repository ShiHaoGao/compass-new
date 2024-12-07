module {
  func.func @extractelement_from_vec_1d_f32_idx_as_index(%arg0: vector<16xf32>) -> f32 {
    %c15 = arith.constant 15 : index
    %0 = vector.extractelement %arg0[%c15 : index] : vector<16xf32>
    return %0 : f32
  }
  func.func @extractelement_from_vec_1d_f32_idx_as_index_scalable(%arg0: vector<[16]xf32>) -> f32 {
    %c15 = arith.constant 15 : index
    %0 = vector.extractelement %arg0[%c15 : index] : vector<[16]xf32>
    return %0 : f32
  }
}