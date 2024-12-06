module {
  func.func @shuffle_0D_direct(%arg0: vector<f32>) -> vector<3xf32> {
    %0 = vector.shuffle %arg0, %arg0 [0, 1, 0] : vector<f32>, vector<f32>
    return %0 : vector<3xf32>
  }
}