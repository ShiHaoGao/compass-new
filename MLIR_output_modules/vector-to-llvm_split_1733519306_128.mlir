module {
  func.func @create_mask_1d_scalable(%arg0: index) -> vector<[4]xi1> {
    %0 = vector.create_mask %arg0 : vector<[4]xi1>
    return %0 : vector<[4]xi1>
  }
}