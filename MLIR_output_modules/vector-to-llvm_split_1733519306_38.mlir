module {
  func.func @shuffle_2D(%arg0: vector<1x4xf32>, %arg1: vector<2x4xf32>) -> vector<3x4xf32> {
    %0 = vector.shuffle %arg0, %arg1 [1, 0, 2] : vector<1x4xf32>, vector<2x4xf32>
    return %0 : vector<3x4xf32>
  }
}