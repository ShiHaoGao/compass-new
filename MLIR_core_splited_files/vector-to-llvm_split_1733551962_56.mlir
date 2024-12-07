module {
  func.func @insert_vec_1d_into_vec_3d_f32(%arg0: vector<16xf32>, %arg1: vector<4x8x16xf32>) -> vector<4x8x16xf32> {
    %0 = vector.insert %arg0, %arg1 [3, 7] : vector<16xf32> into vector<4x8x16xf32>
    return %0 : vector<4x8x16xf32>
  }
  func.func @insert_vec_1d_into_vec_3d_f32_scalable(%arg0: vector<[16]xf32>, %arg1: vector<4x8x[16]xf32>) -> vector<4x8x[16]xf32> {
    %0 = vector.insert %arg0, %arg1 [3, 7] : vector<[16]xf32> into vector<4x8x[16]xf32>
    return %0 : vector<4x8x[16]xf32>
  }
}