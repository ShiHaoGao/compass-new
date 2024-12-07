module {
  func.func @extractelement_from_vec_0d_f32(%arg0: vector<f32>) -> f32 {
    %0 = vector.extractelement %arg0[] : vector<f32>
    return %0 : f32
  }
}