module {
  func.func @outerproduct_index(%arg0: vector<2xindex>, %arg1: vector<3xindex>) -> vector<2x3xindex> {
    %0 = vector.outerproduct %arg0, %arg1 : vector<2xindex>, vector<3xindex>
    return %0 : vector<2x3xindex>
  }
  func.func @outerproduct_index_scalable(%arg0: vector<2xindex>, %arg1: vector<[3]xindex>) -> vector<2x[3]xindex> {
    %0 = vector.outerproduct %arg0, %arg1 : vector<2xindex>, vector<[3]xindex>
    return %0 : vector<2x[3]xindex>
  }
}