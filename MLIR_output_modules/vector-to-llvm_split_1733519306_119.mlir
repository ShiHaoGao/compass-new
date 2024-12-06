module {
  func.func @genbool_0d_t() -> vector<i1> {
    %0 = vector.constant_mask [1] : vector<i1>
    return %0 : vector<i1>
  }
}