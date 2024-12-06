module {
  func.func @insertelement_into_vec_0d_f32(%arg0: f32, %arg1: vector<f32>) -> vector<f32> {
    %0 = vector.insertelement %arg0, %arg1[] : vector<f32>
    return %0 : vector<f32>
  }
}