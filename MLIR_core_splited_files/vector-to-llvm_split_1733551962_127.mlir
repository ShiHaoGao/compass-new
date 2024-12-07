module {
  func.func @create_mask_1d(%arg0: index) -> vector<4xi1> {
    %0 = vector.create_mask %arg0 : vector<4xi1>
    return %0 : vector<4xi1>
  }
}