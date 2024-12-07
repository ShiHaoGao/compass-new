module {
  func.func @shuffle_1D_index_direct(%arg0: vector<2xindex>, %arg1: vector<2xindex>) -> vector<2xindex> {
    %0 = vector.shuffle %arg0, %arg1 [0, 1] : vector<2xindex>, vector<2xindex>
    return %0 : vector<2xindex>
  }
}