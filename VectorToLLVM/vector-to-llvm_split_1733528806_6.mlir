module {
  func.func @broadcast_vec0d_from_vec0d(%arg0: vector<f32>) -> vector<f32> {
    %0 = vector.broadcast %arg0 : vector<f32> to vector<f32>
    return %0 : vector<f32>
  }
}