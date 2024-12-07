module {
  func.func @shuffle_1D_direct(%arg0: vector<2xf32>, %arg1: vector<2xf32>) -> vector<2xf32> {
    %0 = vector.shuffle %arg0, %arg1 [0, 1] : vector<2xf32>, vector<2xf32>
    return %0 : vector<2xf32>
  }
}