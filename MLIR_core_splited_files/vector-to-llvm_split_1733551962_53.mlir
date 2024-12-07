module {
  func.func @insert_scalar_into_vec_1d_f32(%arg0: f32, %arg1: vector<4xf32>) -> vector<4xf32> {
    %0 = vector.insert %arg0, %arg1 [3] : f32 into vector<4xf32>
    return %0 : vector<4xf32>
  }
  func.func @insert_scalar_into_vec_1d_f32_scalable(%arg0: f32, %arg1: vector<[4]xf32>) -> vector<[4]xf32> {
    %0 = vector.insert %arg0, %arg1 [3] : f32 into vector<[4]xf32>
    return %0 : vector<[4]xf32>
  }
}