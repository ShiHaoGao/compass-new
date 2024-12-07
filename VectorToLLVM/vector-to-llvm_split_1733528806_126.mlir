module {
  func.func @create_mask_0d(%arg0: index) -> vector<i1> {
    %0 = vector.create_mask %arg0 : vector<i1>
    return %0 : vector<i1>
  }
}