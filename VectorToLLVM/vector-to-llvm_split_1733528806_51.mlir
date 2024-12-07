module {
  func.func @insertelement_into_vec_1d_f32_idx_as_i32(%arg0: f32, %arg1: vector<4xf32>) -> vector<4xf32> {
    %c3_i32 = arith.constant 3 : i32
    %0 = vector.insertelement %arg0, %arg1[%c3_i32 : i32] : vector<4xf32>
    return %0 : vector<4xf32>
  }
  func.func @insertelement_into_vec_1d_f32_idx_as_i32_scalable(%arg0: f32, %arg1: vector<[4]xf32>) -> vector<[4]xf32> {
    %c3_i32 = arith.constant 3 : i32
    %0 = vector.insertelement %arg0, %arg1[%c3_i32 : i32] : vector<[4]xf32>
    return %0 : vector<[4]xf32>
  }
}