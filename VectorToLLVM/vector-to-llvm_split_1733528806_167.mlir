module {
  func.func @vector_interleave_1d_scalable(%arg0: vector<[4]xi32>, %arg1: vector<[4]xi32>) -> vector<[8]xi32> {
    %0 = vector.interleave %arg0, %arg1 : vector<[4]xi32> -> vector<[8]xi32>
    return %0 : vector<[8]xi32>
  }
}