module {
  func.func @vector_interleave_2d(%arg0: vector<2x3xi8>, %arg1: vector<2x3xi8>) -> vector<2x6xi8> {
    %0 = vector.interleave %arg0, %arg1 : vector<2x3xi8> -> vector<2x6xi8>
    return %0 : vector<2x6xi8>
  }
}