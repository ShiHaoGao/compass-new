module {
  func.func @vector_scalable_insert(%arg0: vector<4xf32>, %arg1: vector<[4]xf32>) -> vector<[4]xf32> {
    %0 = vector.scalable.insert %arg0, %arg1[0] : vector<4xf32> into vector<[4]xf32>
    %1 = vector.scalable.insert %arg0, %0[4] : vector<4xf32> into vector<[4]xf32>
    return %1 : vector<[4]xf32>
  }
}