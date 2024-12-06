module {
  func.func @outerproduct(%arg0: vector<2xf32>, %arg1: vector<3xf32>) -> vector<2x3xf32> {
    %0 = vector.outerproduct %arg0, %arg1 : vector<2xf32>, vector<3xf32>
    return %0 : vector<2x3xf32>
  }
  func.func @outerproduct_scalable(%arg0: vector<2xf32>, %arg1: vector<[3]xf32>) -> vector<2x[3]xf32> {
    %0 = vector.outerproduct %arg0, %arg1 : vector<2xf32>, vector<[3]xf32>
    return %0 : vector<2x[3]xf32>
  }
}