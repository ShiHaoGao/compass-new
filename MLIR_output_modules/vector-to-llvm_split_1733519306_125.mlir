module {
  func.func @genbool_2d() -> vector<4x4xi1> {
    %0 = vector.constant_mask [2, 2] : vector<4x4xi1>
    return %0 : vector<4x4xi1>
  }
}