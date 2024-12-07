module {
  func.func @reduce_index(%arg0: vector<16xindex>) -> index {
    %0 = vector.reduction <add>, %arg0 : vector<16xindex> into index
    return %0 : index
  }
  func.func @reduce_index_scalable(%arg0: vector<[16]xindex>) -> index {
    %0 = vector.reduction <add>, %arg0 : vector<[16]xindex> into index
    return %0 : index
  }
}