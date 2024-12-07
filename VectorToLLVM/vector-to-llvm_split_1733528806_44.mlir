module {
  func.func @extract_scalar_from_vec_1d_index(%arg0: vector<16xindex>) -> index {
    %0 = vector.extract %arg0[15] : index from vector<16xindex>
    return %0 : index
  }
  func.func @extract_scalar_from_vec_1d_index_scalable(%arg0: vector<[16]xindex>) -> index {
    %0 = vector.extract %arg0[15] : index from vector<[16]xindex>
    return %0 : index
  }
}