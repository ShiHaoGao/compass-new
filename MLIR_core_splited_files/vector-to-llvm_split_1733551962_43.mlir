module {
  func.func @extract_vec_1e_from_vec_1d_f32(%arg0: vector<16xf32>) -> vector<1xf32> {
    %0 = vector.extract %arg0[15] : vector<1xf32> from vector<16xf32>
    return %0 : vector<1xf32>
  }
  func.func @extract_vec_1e_from_vec_1d_f32_scalable(%arg0: vector<[16]xf32>) -> vector<1xf32> {
    %0 = vector.extract %arg0[15] : vector<1xf32> from vector<[16]xf32>
    return %0 : vector<1xf32>
  }
}