module {
  func.func @insert_scalar_into_vec_1d_index(%arg0: index, %arg1: vector<4xindex>) -> vector<4xindex> {
    %0 = vector.insert %arg0, %arg1 [3] : index into vector<4xindex>
    return %0 : vector<4xindex>
  }
  func.func @insert_scalar_into_vec_1d_index_scalable(%arg0: index, %arg1: vector<[4]xindex>) -> vector<[4]xindex> {
    %0 = vector.insert %arg0, %arg1 [3] : index into vector<[4]xindex>
    return %0 : vector<[4]xindex>
  }
}