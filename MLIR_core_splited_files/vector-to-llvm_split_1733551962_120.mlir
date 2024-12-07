module {
  func.func @genbool_1d() -> vector<8xi1> {
    %0 = vector.constant_mask [4] : vector<8xi1>
    return %0 : vector<8xi1>
  }
}