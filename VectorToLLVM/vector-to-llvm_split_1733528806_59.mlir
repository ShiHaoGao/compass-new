module {
  func.func @insert_scalar_into_vec_2d_f32_dynamic_idx(%arg0: vector<1x16xf32>, %arg1: f32, %arg2: index) -> vector<1x16xf32> {
    %0 = vector.insert %arg1, %arg0 [0, %arg2] : f32 into vector<1x16xf32>
    return %0 : vector<1x16xf32>
  }
  func.func @insert_scalar_into_vec_2d_f32_dynamic_idx_scalable(%arg0: vector<1x[16]xf32>, %arg1: f32, %arg2: index) -> vector<1x[16]xf32> {
    %0 = vector.insert %arg1, %arg0 [0, %arg2] : f32 into vector<1x[16]xf32>
    return %0 : vector<1x[16]xf32>
  }
}