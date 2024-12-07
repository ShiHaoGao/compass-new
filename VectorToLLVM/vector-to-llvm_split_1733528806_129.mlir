module {
  func.func @transpose_0d(%arg0: vector<f32>) -> vector<f32> {
    %0 = vector.transpose %arg0, [] : vector<f32> to vector<f32>
    return %0 : vector<f32>
  }
}