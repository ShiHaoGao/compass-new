module {
  func.func @shuffle_1D(%arg0: vector<2xf32>, %arg1: vector<3xf32>) -> vector<5xf32> {
    %0 = vector.shuffle %arg0, %arg1 [4, 3, 2, 1, 0] : vector<2xf32>, vector<3xf32>
    return %0 : vector<5xf32>
  }
}