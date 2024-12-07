module {
  func.func @vector_scalable_extract(%arg0: vector<[4]xf32>) -> vector<8xf32> {
    %0 = vector.scalable.extract %arg0[0] : vector<8xf32> from vector<[4]xf32>
    return %0 : vector<8xf32>
  }
}