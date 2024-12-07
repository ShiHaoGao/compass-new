module {
  func.func @vector_interleave_1d(%arg0: vector<8xf32>, %arg1: vector<8xf32>) -> vector<16xf32> {
    %0 = vector.interleave %arg0, %arg1 : vector<8xf32> -> vector<16xf32>
    return %0 : vector<16xf32>
  }
}