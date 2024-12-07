module {
  func.func @extract_vec_1d_from_vec_3d_f32(%arg0: vector<4x3x16xf32>) -> vector<16xf32> {
    %0 = vector.extract %arg0[0, 0] : vector<16xf32> from vector<4x3x16xf32>
    return %0 : vector<16xf32>
  }
  func.func @extract_vec_1d_from_vec_3d_f32_scalable(%arg0: vector<4x3x[16]xf32>) -> vector<[16]xf32> {
    %0 = vector.extract %arg0[0, 0] : vector<[16]xf32> from vector<4x3x[16]xf32>
    return %0 : vector<[16]xf32>
  }
}