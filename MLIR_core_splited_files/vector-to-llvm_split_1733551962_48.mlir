module {
  func.func @extract_scalar_from_vec_1d_f32_dynamic_idx(%arg0: vector<16xf32>, %arg1: index) -> f32 {
    %0 = vector.extract %arg0[%arg1] : f32 from vector<16xf32>
    return %0 : f32
  }
  func.func @extract_scalar_from_vec_1d_f32_dynamic_idx_scalable(%arg0: vector<[16]xf32>, %arg1: index) -> f32 {
    %0 = vector.extract %arg0[%arg1] : f32 from vector<[16]xf32>
    return %0 : f32
  }
}