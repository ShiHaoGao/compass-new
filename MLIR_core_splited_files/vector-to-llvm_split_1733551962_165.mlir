module {
  func.func @vector_interleave_0d(%arg0: vector<i8>, %arg1: vector<i8>) -> vector<2xi8> {
    %0 = vector.interleave %arg0, %arg1 : vector<i8> -> vector<2xi8>
    return %0 : vector<2xi8>
  }
}