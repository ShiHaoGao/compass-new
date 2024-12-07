module {
  func.func @insertelement_into_vec_1d_f32_scalable_idx_as_index(%arg0: f32, %arg1: vector<4xf32>) -> vector<4xf32> {
    %c3 = arith.constant 3 : index
    %0 = vector.insertelement %arg0, %arg1[%c3 : index] : vector<4xf32>
    return %0 : vector<4xf32>
  }
  func.func @insertelement_into_vec_1d_f32_scalable_idx_as_index_scalable(%arg0: f32, %arg1: vector<[4]xf32>) -> vector<[4]xf32> {
    %c3 = arith.constant 3 : index
    %0 = vector.insertelement %arg0, %arg1[%c3 : index] : vector<[4]xf32>
    return %0 : vector<[4]xf32>
  }
}